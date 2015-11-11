//
//  ViewController.swift
//  UIKitDynamics
//
//  Created by WJ on 15/11/11.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit
import CoreMotion
class Ellipse:UIView{
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }}

class ViewController: UIViewController {
    var animator:UIDynamicAnimator!
    let manager = CMMotionManager()
    let noiseField = UIFieldBehavior.noiseFieldWithSmoothness(1.0, animationSpeed: 0.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: view)
        
        let square = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        square.backgroundColor = UIColor.blueColor()
        view.addSubview(square)
        
        let ellipse = Ellipse(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        ellipse.backgroundColor = UIColor.yellowColor()
        ellipse.layer.cornerRadius = 50
        view.addSubview(ellipse)
       
        let items = [square,ellipse]
        
        let gravity = UIGravityBehavior(items: items)
        animator.addBehavior(gravity)
        
        noiseField.addItem(square)
        noiseField.addItem(ellipse)
        noiseField.strength = 0.5
        animator.addBehavior(noiseField)
        
        let collision = UICollisionBehavior(items: items)
        collision.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsets(top: 20, left: 5, bottom: 5, right: 5))
        animator.addBehavior(collision)
        
        if manager.deviceMotionActive{
            manager.deviceMotionUpdateInterval = 0.1
            manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (deviceManager, error ) -> Void in
                gravity.gravityDirection = CGVector(dx: deviceManager!.gravity.x, dy: -deviceManager!.gravity.y)
            })
        }
        animator.debugEnabled = true
    }

    @IBAction func strengthValueChanged(sender: UISlider) {
        noiseField.strength = CGFloat( sender.value)
    }

    @IBAction func smoothnessValueChanged(sender: UISlider) {
        noiseField.smoothness = CGFloat(sender.value)
    }

    @IBAction func speedValueChanged(sender: UISlider) {
        noiseField.animationSpeed = CGFloat(sender.value)
    }

}

