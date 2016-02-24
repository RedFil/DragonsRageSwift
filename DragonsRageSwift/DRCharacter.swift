//
//  DRCharacter.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-23.
//  Copyright © 2016 Filipe Kunioshi. All rights reserved.
//

import SpriteKit

class DRCharacter: DRSpriteNode {
    /**
     The character's health.
     
     By default value it is 100.
     */
    private(set) var health: Float = 100 {
        didSet {
            if self.health <= 0 {
                self.isAlive = false
            }
        }
    }
    
    /**
     If the character is alive (`health` more than 0).
     */
    private(set) var isAlive: Bool = true
}
