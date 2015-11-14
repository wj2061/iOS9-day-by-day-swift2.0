//
//  NodeEntity.swift
//  GameplayKitBehaviors
//
//  Created by wj on 15/11/14.
//  Copyright © 2015年 wj. All rights reserved.
//

import GameKit

class NodeEntity: GKEntity {
    
    var node:EntityNode{
        get{
            return componentForClass(RenderComponent.self )!.node
        }
    }
}
