//
//  GameScene.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-21.
//  Copyright (c) 2016 Filipe Kunioshi. All rights reserved.
//

import SpriteKit

class ScnMenu: SKScene {
    override func didMoveToView(view: SKView) {
        // Add the background image
        let imgMenuBG = SKSpriteNode(imageNamed: "MenuBG")
        imgMenuBG.size = self.size
        imgMenuBG.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        imgMenuBG.zPosition = -100
        
        self.addChild(imgMenuBG)
        
        // Add buttons
        let btnPlay = SKSpriteNode(imageNamed: "MenuBtnJogar")
        btnPlay.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 50)
        
        let btnRank = SKSpriteNode(imageNamed: "MenuBtnRank")
        btnRank.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - (btnPlay.position.x + btnPlay.size.height) - 50)
        
        self.addChild(btnPlay)
        self.addChild(btnRank)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.01
            sprite.yScale = 0.01
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
