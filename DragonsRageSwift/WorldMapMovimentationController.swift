//
//  WorldMapMovimentationController.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-27.
//  Copyright © 2016 Filipe Kunioshi. All rights reserved.
//

import SpriteKit

class WorldMapMovimentationController {
    
    /**
     The bases of the WorldMap grid.
     */
    let worldMap: DRWorldMap = DRWorldMap()
    
    /**
     The `Node` that hold the World Map Tiles as Sprite Nodes.
     */
    var gridMapNode: DRSpriteNode = DRSpriteNode()
    
    /**
     The location where the user started a touch (`touchBegan`).
     */
    private var initialTouchPosition: CGPoint? = CGPoint()
    
    /**
     The current user's touch location (`touchesMoved`)
     */
    private var currentTouchPosition: CGPoint = CGPoint()
    
    /**
     Save the first Moving Touch's position to use as reference to check for movement commands.
     
     - parameters:
        - touchPosition: The position of the Moving Touch.
     */
    func receiveMoveTouchBegan(touchPosition: CGPoint) {
        initialTouchPosition = touchPosition
    }
    
    /**
     Receive and compare the new Moving Touch position to check of there is a move command.
     
     - parameters:
        -touchPosition: The new position of the Moving Touch.
     */
    func receiveMoveTouchMoved(touchPosition: CGPoint) {
        currentTouchPosition = touchPosition
        
        checkPadDirectionTouched()
    }
    
    /**
     Clear the references from the previous Moving Touch to make sure of no wrong references in a future Moving Touch event.
     */
    func receiveMoveTouchEnded() {
        initialTouchPosition = nil
    }
    
    func checkPadDirectionTouched() {
        // TODO: Print a +Pad and then verify collision with one of the arrows (move command)
    }
}