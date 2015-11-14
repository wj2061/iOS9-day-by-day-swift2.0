//
//  PlayerNode.swift
//  GameplayKitBehaviors
//
//  Created by wj on 15/11/14.
//  Copyright © 2015年 wj. All rights reserved.
//

import GameKit
import SpriteKit

class PlayerNode: EntityNode {
    let shape = SKShapeNode(rect: CGRectMake(0, 0, 40, 40))
    
    override init(){
        super.init()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        shape.fillColor = .blueColor()
        addChild(shape)
    }

}
