//
//  GameScene.swift
//  GameplayKitPathfinding
//
//  Created by WJ on 15/11/13.
//  Copyright © 2015年 wj. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var moving:Bool = false
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let location = touch.locationInNode(self)
            self.movePlayerToLocation(location)
        }
    }

    func  movePlayerToLocation(location:CGPoint){
        guard !moving else {return}
        moving = true
        
        let player = self.childNodeWithName("player")
        
        let obstacles = SKNode.obstaclesFromNodeBounds(self.children.filter({ (element ) -> Bool in
            return element != player
        }))
        
        let graph = GKObstacleGraph(obstacles: obstacles, bufferRadius: 10)
        
        let startNode = GKGraphNode2D(point: float2(Float(player!.position.x), Float(player!.position.y)))
        let endNode = GKGraphNode2D(point: float2(Float(location.x), Float(location.y)))
        
        graph.connectNodeUsingObstacles(startNode)
        graph.connectNodeUsingObstacles(endNode)
        
        let path = graph.findPathFromNode(startNode, toNode: endNode)
        
        guard path.count > 0 else {moving = false ; return}
        
        var actions = [SKAction]()
        
        for node in path{
            if let point2d = node as? GKGraphNode2D{
                let point = CGPoint(x: CGFloat(point2d.position.x), y: CGFloat(point2d.position.y))
                let action = SKAction.moveTo(point, duration: 0.3)
                actions.append(action)
            }
        }
        
        let sequence = SKAction.sequence(actions)
        player?.runAction(sequence, completion: { () -> Void in
            self.moving = false
        })
    }

}
