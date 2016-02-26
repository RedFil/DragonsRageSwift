//
//  DRWorldMap.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-25.
//  Copyright © 2016 Filipe Kunioshi. All rights reserved.
//

import SpriteKit

/**
 All the possible tile types in the World Map.
 */
public enum WorldMapGridType: Int {
    case None = -999
    
    // Walkables
    case Grass = 0
    case Dirt = 2
    case Water = 6
    
    // Usables (walkables)
    case Cave = 3
    case CastleDirt = 4
    case CastleGrass = 5
    
    // Non-walkables
    case Mountain = 1
}

class DRWorldMap {
    /**
     The type based world map.
     
     Obs.: No Sprites and/or Nodes are in here.
     */
    var map: [[WorldMapGridType]] = [[]]
    
    /**
     The Textures dictionary for each value of `WorldMapGridType`.
     */
    var tileTextures: [WorldMapGridType: SKTexture] = [.None: SKTexture()]
    
    /**
     The size which each tile in the World Map Scene should have.
     
     Obs.: By default it is based on the size of the Grass sprite image.
     */
    let worldTileSize: CGFloat
    
    /**
     Initializes the Tile Texture dictionary (`tileTextures`) and set the size of the world sprite nodes (`worldTileSize`).
     */
    init() {
        // MARK: Adding which sprite each TileType should be
        
        // Walkables
        tileTextures[.Grass] = SKTexture(imageNamed: "tile-grass")
        tileTextures[.Dirt] = SKTexture(imageNamed: "tile-earth")
        tileTextures[.Water] = SKTexture(imageNamed: "tile-water")
        
        // Usables (walkables)
        tileTextures[.Cave] = SKTexture(imageNamed: "tile-cave")
        tileTextures[.CastleDirt] = SKTexture(imageNamed: "tile-castle-earth")
        tileTextures[.CastleGrass] = SKTexture(imageNamed: "tile-castle-grass")
        
        // Non-walkables
        tileTextures[.Mountain] = SKTexture(imageNamed: "tile-mountain")
        
        
        // Defining the size of the grid tiles
        worldTileSize = tileTextures.first!.1.size().height
    }
    
    /**
     Creates the initial world map.
     */
    func generateMap() {
        // Temp map (Mockup)
        let tempMap: [[Int]] =
        [
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            [1,1,1,2,1,1,1,2,2,2,2,2,2,1,1,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1],
            [1,1,2,3,2,2,2,2,2,0,0,0,2,2,2,2,1,1,1,1,2,2,2,2,2,1,1,1,1,1],
            [1,1,1,2,2,2,2,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1],
            [1,1,1,1,2,2,2,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,1,2,2,1,1,1],
            [1,1,1,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,1,1,2,2,1,1,1],
            [1,1,1,2,2,1,1,2,0,0,0,0,6,6,0,0,0,0,0,0,2,2,1,1,1,2,2,1,1,1],
            [1,1,2,2,1,2,2,2,0,0,0,6,6,6,6,0,0,0,0,0,2,1,1,1,2,2,2,2,1,1],
            [1,1,2,2,2,2,0,0,0,0,0,0,0,6,6,0,0,0,0,2,2,1,1,1,2,2,2,2,1,1],
            [1,1,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,1,1,2,2,2,2,2,1,1],
            [1,6,6,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,3,1,2,2,2,2,1,1,1],
            [1,6,6,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,0,0,2,1,1,1],
            [1,2,2,6,6,6,5,6,6,6,6,0,0,6,6,6,6,6,0,0,0,0,0,0,0,0,2,2,1,1],
            [1,2,2,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,0,0,0,0,0,0,0,2,2,1],
            [1,1,2,2,0,0,6,6,0,0,6,6,6,6,6,5,6,6,6,0,0,0,0,0,0,0,0,0,2,1],
            [1,1,1,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1],
            [1,1,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,0,0,0,0,2,2,1],
            [1,2,2,3,1,2,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,0,0,0,0,0,2,2,1,1],
            [1,2,2,1,1,2,0,0,0,0,0,0,0,0,0,2,2,1,1,1,2,0,0,0,0,0,2,2,1,1],
            [1,1,2,2,1,2,0,0,0,0,0,0,0,0,0,2,2,1,3,2,2,0,0,0,0,0,0,2,2,1],
            [1,1,2,2,2,6,6,6,6,0,0,0,0,0,0,2,1,2,2,2,6,6,0,0,0,0,0,2,2,1],
            [1,1,2,2,2,6,6,6,6,6,0,0,0,0,0,2,2,2,2,6,6,6,0,0,0,0,0,2,2,1],
            [1,1,1,2,2,2,6,6,6,2,2,2,2,0,0,0,0,6,6,6,6,0,0,0,0,0,0,2,2,1],
            [1,1,1,2,2,2,2,2,2,2,1,1,2,2,0,0,0,6,6,6,0,0,0,0,0,2,2,2,1,1],
            [1,1,1,2,2,2,2,2,2,2,1,1,1,2,0,0,0,0,0,0,0,0,0,2,2,2,2,2,1,1],
            [1,1,1,2,2,2,4,2,2,2,1,1,1,2,2,0,0,0,0,0,0,2,2,2,2,2,2,2,1,1],
            [1,1,1,1,1,2,2,2,2,1,1,1,1,1,2,2,2,0,0,2,2,2,1,2,2,2,4,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,1,1,1,1,2,2,1,1,1,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
        ];
        
        // Convert the Int based map into WorldMapGridType map
        var tempMapConverted: [[WorldMapGridType]] = [[]]
        for (index, tempRow) in tempMap.enumerate() {
            let tempRowConverted: [WorldMapGridType] = tempRow.map( { WorldMapGridType(rawValue: $0)! } )
            tempMapConverted.insert(tempRowConverted, atIndex: index)
        }
        
        map = tempMapConverted
    }
}