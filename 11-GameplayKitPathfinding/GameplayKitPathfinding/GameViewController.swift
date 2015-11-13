//
//  GameViewController.swift
//  GameplayKitPathfinding
//
//  Created by WJ on 15/11/13.
//  Copyright (c) 2015年 wj. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("111")
        // create a new scene
        if let scene = GameScene(fileNamed: "GameScene"){
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            
            scene.scaleMode = .AspectFit
            skView.presentScene(scene)
            print("222")

        }
    }


    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }


}
