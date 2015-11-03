//
//  FriendViewController.swift
//  SearchAPIs
//
//  Created by WJ on 15/11/3.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    var  person : Person!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person.name
        imageView.image = person.image
    }
}
