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
     The bases of the WorldMap grid.
     */
    private let worldMap: DRWorldMap = DRWorldMap()
    
    /**
     The `Node` that hold the World Map Tiles as Sprite Nodes.
     */
    private var gridMapNode: DRSpriteNode = DRSpriteNode()
    
    override func didMoveToView(view: SKView) {
        // Adding the main character in the scene
        ScnWorldMap.mainCharacter.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        ScnWorldMap.mainCharacter.zPosition = 10
        
        self.addChild(ScnWorldMap.mainCharacter)
        
        // Map creation
        createLogicalMap()
        createMapSprite()
        gridMapNode.position.y += self.frame.height
        
        self.addChild(gridMapNode)
        
        // MARK: HUD creation
        // TODO: Create the HUD sprite nodes
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // TODO: Implement the interaction with the in-game menu.
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
    
    // MARK: Map creation
    
    /**
     Creates the map as a code for future transcription to sprites.
     */
    func createLogicalMap() {
        worldMap.generateMap()
    }
    
    /**
     Transcribes the World Map code based into sprite based map in the scene.
     */
    func createMapSprite() {
        for (y, tileRow) in worldMap.map.enumerate() {
            for (x, tileType) in tileRow.enumerate() {
                let tileNode = DRSpriteNode(texture: worldMap.tileTextures[tileType])
                tileNode.position = CGPoint(x: CGFloat(x) * worldMap.worldTileSize, y: CGFloat(-y) * worldMap.worldTileSize)
                
                gridMapNode.addChild(tileNode)
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
