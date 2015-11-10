//
//  ConfirmationViewController.swift
//  ApplePay
//
//  Created by WJ on 15/11/10.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit
import PassKit

class ConfirmationViewController: UIViewController {
    var paymentToken:PKPaymentToken!
    
    @IBOutlet weak var idLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.idLabel.text = paymentToken?.transactionIdentifier
    }


}
