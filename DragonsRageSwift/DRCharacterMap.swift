//
//  DRCharacterMap.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-23.
//  Copyright © 2016 Filipe Kunioshi. All rights reserved.
//

import SpriteKit

class DRCharacterMap: DRCharacter {
    /**
     The character's position in the WorldMap.
     */
    private var worldPosition: CGPoint = CGPoint()
    
    /**
     The character's `x` position in the WorldMap Scene.
     */
    private(set) var x: Float {
        get {
            return Float(worldPosition.x)
        }
        set {
            worldPosition.x = CGFloat(newValue)
        }
    }
    
    /**
     The character's `y` position in the WorldMap Scene.
     */
    private(set) var y: Float {
        get {
            return Float(worldPosition.y)
        }
        set {
            worldPosition.y = CGFloat(newValue)
        }
    }
}
