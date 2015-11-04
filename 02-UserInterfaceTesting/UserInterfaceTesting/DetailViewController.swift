//
//  DetailViewController.swift
//  UserInterfaceTesting
//
//  Created by WJ on 15/11/4.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var value = 0
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func incrementTapped(sender: UIButton) {
        value++
        valueLabel.text = "\(value)"
        valueLabel.accessibilityValue = valueLabel.text
    }
}
