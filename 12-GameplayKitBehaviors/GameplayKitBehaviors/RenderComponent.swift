//
//  RenderComponent.swift
//  GameplayKitBehaviors
//
//  Created by wj on 15/11/14.
//  Copyright © 2015年 wj. All rights reserved.
//

import SpriteKit
import GameplayKit

class RenderComponent: GKComponent {
    let node = EntityNode()
    
    init(entity: GKEntity) {
        node.entity = entity
    }

}
