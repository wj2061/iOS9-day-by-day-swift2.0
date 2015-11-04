//
//  MenuViewController.swift
//  UserInterfaceTesting
//
//  Created by WJ on 15/11/4.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var viewDetailButton: UIButton!
    
    @IBAction func switchValueChanged(sender: UISwitch) {
        viewDetailButton.enabled = sender.on
        viewDetailButton.alpha = sender.on ? 1: 0.5
    }
}
