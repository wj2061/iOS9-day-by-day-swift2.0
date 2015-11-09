//
//  DetailViewController.swift
//  ContactsFramework
//
//  Created by WJ on 15/11/9.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit
import Contacts

class DetailViewController: UIViewController {
    var contact:CNContact?{
        didSet{
            configureView()
        }
    }

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneNumberLabel: UILabel!



    func configureView() {
        // Update the user interface for the detail item.
        if let contact = self.contact {
            contactNameLabel?.text = CNContactFormatter.stringFromContact(contact, style: .FullName)
            
            if contact.imageData != nil{
                contactImageView?.image = UIImage(data: contact.imageData!)
            }
            
            var numberArray = [String]()
            for number in contact.phoneNumbers{
                let phoneNumber = number.value as! CNPhoneNumber
                numberArray.append(phoneNumber.stringValue)
            }
            contactPhoneNumberLabel?.text = numberArray.joinWithSeparator(", ")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

