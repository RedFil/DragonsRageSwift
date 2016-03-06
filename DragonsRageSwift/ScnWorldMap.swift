//
//  ScnWorldMap.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-23.
//  Copyright © 2016 Filipe Kunioshi. All rights reserved.
//

import SpriteKit

class ScnWorldMap: DRScene {
    /**
     The Main Character of the game (the Player itself).
     */
    static let mainCharacter: DRCharacter = DRCharacter(imageNamed: "player")
    
    /**
     The movement controller.
     */
    private let moveController: WorldMapMovimentationController = WorldMapMovimentationController()
    
    /**
     Holds the touch dedicated to the movementation.
     */
    private var movingTouch: UITouch?
    
    override func didMoveToView(view: SKView) {
        // Adding the main character in the scene
        ScnWorldMap.mainCharacter.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        ScnWorldMap.mainCharacter.zPosition = 10
        
        self.addChild(ScnWorldMap.mainCharacter)
        
        // Map creation
        moveController.worldMap.generateMap()
        createMapSprite()
        moveController.gridMapNode.position.y += self.frame.height
        
        self.addChild(moveController.gridMapNode)
        
        // MARK: HUD creation
        // TODO: Create the HUD sprite nodes
    }
    
    // MARK: Map/Character Movementation
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Save the first touch as the Moving Touch
        if let firstTouch = touches.first {
            movingTouch = firstTouch
            moveController.receiveMoveTouchBegan(firstTouch.locationInNode(self))
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Search for the Moving Touch between all touches
        for touch in touches where touch == movingTouch {
            moveController.receiveMoveTouchMoved(touch.locationInNode(self))
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Search for the Moving Touch between all touches
        for touch in touches where touch == movingTouch {
            moveController.receiveMoveTouchEnded()
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
    
    // MARK: Map creation
    
    /**
     Transcribes the World Map *Code based* into *Sprite based* map in the scene.
     */
    func createMapSprite() {
        for (y, tileRow) in moveController.worldMap.map.enumerate() {
            for (x, tileType) in tileRow.enumerate() {
                let tileNode = DRSpriteNode(texture: moveController.worldMap.tileTextures[tileType])
                tileNode.position = CGPoint(x: CGFloat(x) * moveController.worldMap.worldTileSize, y: CGFloat(-y) * moveController.worldMap.worldTileSize)
                
                moveController.gridMapNode.addChild(tileNode)
            }
        }
    }
    
    /**
     Creates a `SpriteNode` for a world map tile of the given `type` at the given grid `position`.
     
     - parameters:
        - type: Which type the tile should be created.
        - position: The tile's position in the *Code Based* World Map.
        - tileSize: Which size one tile should be. (*Used to calculate the the new tile position according to the Code Based map*)
     */
    func createMapTileSprite(type: WorldMapGridType, position: CGPoint, tileSize: Float) {
        
    }
}
