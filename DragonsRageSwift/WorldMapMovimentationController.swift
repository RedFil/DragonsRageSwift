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
     The Sprite Node with the move/directional pad (NOT pressed) to be shown in the World Map Scene.
     */
    let directionalDefaultPadNode: DRSpriteNode = DRSpriteNode(imageNamed: "dpad")
    
    /**
     The Sprite Node with the move/directional pad (PRESSED) to be shown in the World Map Scene.
     */
    let directionalPressedPadNode: DRSpriteNode = DRSpriteNode(imageNamed: "dpadClicked")
    
    /**
     The location where the user started a touch (`touchBegan`).
     */
    private var initialTouchPosition: CGPoint? = CGPoint()
    
    /**
     The current user's touch location (`touchesMoved`)
     */
    private var currentTouchPosition: CGPoint = CGPoint()
    
    /**
     The Directional Pad's distance from the initial touch position.
     */
    let padButtonDistance: CGFloat = 45.0
    
    /**
     Save the first Moving Touch's position to use as reference to check for movement commands.
     
     - parameters:
        - touchPosition: The position of the Moving Touch.
     */
    func receiveMoveTouchBegan(touchPosition: CGPoint) {
        initialTouchPosition = touchPosition
        
        showDirectionalPad(false)
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
        
        hideDirectionalPad()
    }
    
    func checkPadDirectionTouched() {
        // TODO: Print a +Pad and then verify collision with one of the arrows (move command)
        if let initPos = initialTouchPosition where hypotf(Float(initPos.x - currentTouchPosition.x), Float(initPos.y - currentTouchPosition.y)) > Float(padButtonDistance) {
            // Check in which direction the player pressed and rotate the pressed directional pad accordingly
            if (initPos.x - currentTouchPosition.x > padButtonDistance) {
                // Touched LEFT
                directionalPressedPadNode.zRotation = CGFloat(M_PI)
            } else if (initPos.x - currentTouchPosition.x < -padButtonDistance) {
                // Touched RIGHT
                directionalPressedPadNode.zRotation = CGFloat(M_PI*2)
            } else if (initPos.y - currentTouchPosition.y > padButtonDistance) {
                // Touched DOWN
                directionalPressedPadNode.zRotation = CGFloat(M_PI*3/2)
            } else if (initPos.y - currentTouchPosition.y < -padButtonDistance) {
                // Touched UP
                directionalPressedPadNode.zRotation = CGFloat(M_PI/2)
            }
            
            showDirectionalPad(true)
        } else {
            showDirectionalPad(false)
        }
    }
    
    func showDirectionalPad(pressed: Bool) {
        if let initPos = initialTouchPosition {
            directionalDefaultPadNode.position = initPos
            directionalPressedPadNode.position = initPos
            
            if (!pressed) {
                directionalDefaultPadNode.hidden = false
                directionalPressedPadNode.hidden = true
            } else {
                directionalDefaultPadNode.hidden = true
                directionalPressedPadNode.hidden = false
            }
        }
    }
    
    func hideDirectionalPad() {
        directionalDefaultPadNode.hidden = true
        directionalPressedPadNode.hidden = true
    }
    
    func setSceneForDirectionalPad(scene: DRScene) {
        if(scene.childNodeWithName("dPadDefaultNode") == nil) {
            directionalDefaultPadNode.name = "dPadDefaultNode"
            directionalDefaultPadNode.zPosition = 1000
            directionalPressedPadNode.name = "dPadPressedNode"
            directionalPressedPadNode.zPosition = 1000
            
            scene.addChild(directionalDefaultPadNode)
            scene.addChild(directionalPressedPadNode)
        }
    }
}