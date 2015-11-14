//
//  MissileNode.swift
//  GameplayKitBehaviors
//
//  Created by wj on 15/11/14.
//  Copyright © 2015年 wj. All rights reserved.
//


import GameKit
import SpriteKit

class MissileNode: EntityNode {
    
    func setupEmitters(withTargetScene scene:SKScene) {
        
        let smoke = NSKeyedUnarchiver.unarchiveObjectWithFile(NSBundle.mainBundle().pathForResource("MissileSmoke", ofType: "sks")!) as! SKEmitterNode
        smoke.targetNode = scene
        self.addChild(smoke)
        
        let fire = NSKeyedUnarchiver.unarchiveObjectWithFile(NSBundle.mainBundle().pathForResource("MissileFire", ofType: "sks")!) as! SKEmitterNode
        fire.targetNode = scene
        self.addChild(fire)
    }
}
