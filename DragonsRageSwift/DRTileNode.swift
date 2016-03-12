//
//  DRTileNode.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-03-05.
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

class DRTileNode: DRSpriteNode {
    /**
     The type of this tile
     */
    var tileType: WorldMapGridType = .Mountain
    
    // Override implemented to gain access to the `convenience` init(texture)
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    /**
     Init a World Map grid tile with a given type.
     
     All the other atributes are defined by the given type.
     
     - parameters:
        - tileType: Which type this tile should be.
     */
    convenience init(tileType: WorldMapGridType) {
        let tileTexture = DRWorldMap.tileTextures[tileType]!
        self.init(texture: tileTexture)
        
        self.tileType = tileType
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
