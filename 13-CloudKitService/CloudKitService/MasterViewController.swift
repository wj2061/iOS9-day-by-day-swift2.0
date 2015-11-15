//
//  MasterViewController.swift
//  CloudKitService
//
//  Created by wj on 15/11/15.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit
import CloudKit


class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [CKRecord]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        let publicDatabase = CKContainer(identifier: "iCloud.wj.CloudNotes").publicCloudDatabase
        let query = CKQuery(recordType: "CloudNote", predicate: NSPredicate(format: "TRUEPREDICATE"))
        publicDatabase.performQuery(query, inZoneWithID: nil) { (records , error ) -> Void in
            if error != nil{
                NSLog("Error performing query. \(error.debugDescription)")
                return
            }
            self.objects = records!
            self.tableView.reloadData()
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object.objectForKey("title") as? String
        return cell
    }

}

