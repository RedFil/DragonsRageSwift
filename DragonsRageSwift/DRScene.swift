//
//  DRScene.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-22.
//  Copyright © 2016 Filipe Kunioshi. All rights reserved.
//

import SpriteKit

class DRScene: SKScene {
    /**
     Get all `SKSpriteNode` at a given position.
     
     **Obs.**: Only nodes with **`name`** property will be captured.
     
     - parameters:
        - position: The position where the touch happened.
     
     - returns: All the `SKSpriteNode` that have a part of it in the `position`.
     */
    internal func getSpriteNodesAt(position: CGPoint) -> [SKSpriteNode] {
        // Get only subclasses from SKSpriteNode
        var touchedNodes: [SKSpriteNode] = self.nodesAtPoint(position).filter( {$0.isMemberOfClass(SKSpriteNode)} ) as! [SKSpriteNode]
        
        // Get only interactive nodes
        touchedNodes = touchedNodes.filter( {$0.name != nil} )
        
        return touchedNodes
    }
    
    /**
     Get the `SKSpriteNode` with the highest `zPosition` at a given position.
     
     **Obs.**: Only nodes with **`userInteractionEnabled`** enabled will be captured.
     
     - parameters:
        - position: The position where the touch happened.
     
     - returns: The `SKSpriteNode` that have a part of it in the `position` with the highest `zPosition`.
     */
    internal func getFirstSpriteNodeAt(position: CGPoint) -> SKSpriteNode? {
        var touchedNodes: [SKSpriteNode] = getSpriteNodesAt(position)
        
        // Sort the array according to their zPosition
        touchedNodes = touchedNodes.sort( {$0.zPosition > $1.zPosition} )
        
        return touchedNodes.first
    }
}