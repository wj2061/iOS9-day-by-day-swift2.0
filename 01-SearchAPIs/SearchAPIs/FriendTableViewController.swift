//
//  FriendTableViewController.swift
//  SearchAPIs
//
//  Created by WJ on 15/11/3.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit
import CoreSpotlight


class FriendTableViewController: UITableViewController {
    let  datasource = Datasource()
    
//    var  lastSelectedFriend : Person?

    override func viewDidLoad() {
        super.viewDidLoad()

      datasource.savePeopleToIndex()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.people.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let person = datasource.people[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }

    func showFriend(id: String){
        let person = datasource.friendFromID(id)
        let row = datasource.people.indexOf(person!)
        let indexpath = NSIndexPath(forRow: row!, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(indexpath)
        
        performSegueWithIdentifier("showFriend", sender: cell)
      
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFriend"{
           let VC = segue.destinationViewController  as! FriendViewController
           let indexpath = tableView.indexPathForCell(sender as! UITableViewCell)
            VC.person = datasource.people[indexpath!.row]
        }

    }

}
