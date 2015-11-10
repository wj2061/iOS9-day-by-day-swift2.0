//
//  ViewController.swift
//  ApplePay
//
//  Created by WJ on 15/11/10.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit
import PassKit

class ViewController: UIViewController,PKPaymentAuthorizationViewControllerDelegate {
    @IBOutlet weak var bottomToolbar: UIView!
    var paymentToken:PKPaymentToken!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paymentButton = PKPaymentButton(type: .Buy, style: .Black)
        paymentButton.addTarget(self, action: "buyNowButtonTapped:", forControlEvents: .TouchUpInside)
        paymentButton.translatesAutoresizingMaskIntoConstraints = false
        
        bottomToolbar.addSubview(paymentButton)
        bottomToolbar.addConstraint(NSLayoutConstraint(item: paymentButton, attribute: .CenterX, relatedBy: .Equal, toItem: bottomToolbar, attribute: .CenterX, multiplier: 1, constant: 0))
        bottomToolbar.addConstraint(NSLayoutConstraint(item: paymentButton, attribute: .CenterY, relatedBy: .Equal, toItem: bottomToolbar, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    
    func buyNowButtonTapped(sender: UIButton) {
        let paymentNetworks = [
            PKPaymentNetworkAmex,
            PKPaymentNetworkVisa,
            PKPaymentNetworkDiscover,
            PKPaymentNetworkPrivateLabel,
            PKPaymentNetworkMasterCard]
        
        if PKPaymentAuthorizationViewController.canMakePaymentsUsingNetworks(paymentNetworks){
            let request = PKPaymentRequest()
            
            request.merchantIdentifier = "merchant.wj"
            request.countryCode = "US"
            request.currencyCode = "USD"
            request.supportedNetworks = paymentNetworks
            request.merchantCapabilities = .Capability3DS
            
            let shinobiToySummaryItem = PKPaymentSummaryItem(label: "Shinobi Cuddly Toy", amount: NSDecimalNumber(double: 22.99), type : .Final )
            let shinobiPostageSummaryItem = PKPaymentSummaryItem(label: "Postage", amount: NSDecimalNumber(double: 3.99), type: .Final)
            let shinobiTaxSummaryItem = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(double: 2.29), type: .Final)
            let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(double: 29.27), type: .Final)
            
            request.paymentSummaryItems = [shinobiToySummaryItem,shinobiPostageSummaryItem,shinobiTaxSummaryItem,total]
            
            let authorizationViewController = PKPaymentAuthorizationViewController(paymentRequest: request)
            authorizationViewController.delegate = self
            presentViewController(authorizationViewController, animated: true, completion: nil)
        }else{
            print("Apple Pay is not available.")
        }
    }
    
    func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: (PKPaymentAuthorizationStatus) -> Void) {
        paymentToken = payment.token
        completion(.Success)
        
        self.performSegueWithIdentifier("purchaseConfirmed", sender: self)
    }
    
    func paymentAuthorizationViewControllerDidFinish(controller: PKPaymentAuthorizationViewController) {
        self.dismissViewControllerAnimated(true , completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let confirmation = segue.destinationViewController as! ConfirmationViewController
        confirmation.paymentToken = paymentToken
    }

}

