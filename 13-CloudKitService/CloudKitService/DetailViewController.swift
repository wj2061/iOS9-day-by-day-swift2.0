//
//  DetailViewController.swift
//  CloudKitService
//
//  Created by wj on 15/11/15.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit
import CloudKit


class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: CKRecord? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.objectForKey("content") as? String
                self.title = detail.objectForKey("title") as? String
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
}

