//
//  ViewController.swift
//  UIStack
//
//  Created by WJ on 15/11/6.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var peopleStackView: UIStackView!

    @IBAction func segmentSelected(sender: UISegmentedControl) {
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .CurveEaseInOut, animations: { () -> Void in
            switch sender.selectedSegmentIndex{
            case 0:
                self.peopleStackView.alignment = .Fill
            case 1:
                self.peopleStackView.alignment = .Top
            case 2:
                self.peopleStackView.alignment = .Center
            case 3:
                self.peopleStackView.alignment = .Bottom
            default:
                break
            }
            }, completion: nil )
    }
    
    @IBAction func distributionSegmentSelected(sender: UISegmentedControl) {
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .CurveEaseInOut, animations: { () -> Void in
            switch sender.selectedSegmentIndex{
            case 0 :
                self.peopleStackView.distribution = .Fill
            case 1:
                self.peopleStackView.distribution = .FillEqually
            case 2:
                self.peopleStackView.distribution = .FillProportionally
            case 3:
                self.peopleStackView.distribution = .EqualSpacing
            case 4:
                self.peopleStackView.distribution = .EqualCentering
            default:
                break
            }
            }, completion: nil)
    }
}

