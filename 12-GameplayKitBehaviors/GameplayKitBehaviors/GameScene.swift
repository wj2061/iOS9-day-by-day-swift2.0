//
//  GameScene.swift
//  GameplayKitBehaviors
//
//  Created by wj on 15/11/14.
//  Copyright © 2015年 wj. All rights reserved.
//

import SpriteKit
import GameKit

class GameScene: SKScene {
    let player:Player = Player()

    var missile:Missile?
    
    var lastUpdateTimeInterval: NSTimeInterval = 0
    
    lazy var componentSystems:[GKComponentSystem] = {
        let targetingSystem = GKComponentSystem(componentClass: TargetingComponent.self)
        let renderSystem = GKComponentSystem(componentClass: RenderComponent.self)
        return [targetingSystem, renderSystem]
    }()

    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        player.node.position = CGPoint(x: 100, y: 100)
        self.addChild(player.node)
        
        missile = Missile(withTargetAgent: player.agent)
        
        missile!.setupEmitters(withTargetScene: self)
        self.addChild(missile!.node)
        
        for system in componentSystems{
            system.addComponentWithEntity(player)
            system.addComponentWithEntity(missile!)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let location = touch.locationInNode(self)
            player.agent.position = float2(Float(location.x), Float(location.y))
            player.agent.delegate?.agentDidUpdate!(player.agent)
        }
    }
    
    override func update(currentTime: NSTimeInterval) {
        let deltaTime = currentTime - lastUpdateTimeInterval
        
        for componentSystem in componentSystems {
            componentSystem.updateWithDeltaTime(deltaTime)
        }
        
        lastUpdateTimeInterval = currentTime
    }

}
