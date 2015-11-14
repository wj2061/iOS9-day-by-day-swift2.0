//
//  Player.swift
//  GameplayKitBehaviors
//
//  Created by wj on 15/11/14.
//  Copyright © 2015年 wj. All rights reserved.
//

import GameKit

class Player: NodeEntity ,GKAgentDelegate{
    let agent:GKAgent2D = GKAgent2D()
    
    override init() {
        super.init()
        
        let renderComponent = RenderComponent(entity: self)
        renderComponent.node.addChild(PlayerNode())
        addComponent(renderComponent)
        
        agent.delegate = self
        addComponent(agent)
    }
    
    func agentDidUpdate(agent: GKAgent) {
        if let agent2d  = agent as? GKAgent2D{
            node.position = CGPoint(x: CGFloat(agent2d.position.x), y: CGFloat(agent2d.position.y))
        }
    }
    
    func agentWillUpdate(agent: GKAgent) {
        if let agent2d = agent as? GKAgent2D {
            agent2d.position = float2(Float(node.position.x), Float(node.position.y))
        }
    }

    


}
