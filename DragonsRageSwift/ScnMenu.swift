//
//  GameScene.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-21.
//  Copyright (c) 2016 Filipe Kunioshi. All rights reserved.
//

import SpriteKit

class ScnMenu: DRScene {
    override func didMoveToView(view: SKView) {
        // Add the background image
        let imgMenuBG = DRSpriteNode(imageNamed: "MenuBG")
        imgMenuBG.size = self.size
        imgMenuBG.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        imgMenuBG.zPosition = -100
        
        self.addChild(imgMenuBG)
        
        // MARK: Add buttons
        
        // Add Play Button
        let btnPlay = DRSpriteNode(imageNamed: "MenuBtnJogar")
        btnPlay.name = "MenuBtnJogar"
        btnPlay.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 50)
        
        // Add Rank Button (according to the Play Button)
        let btnRank = DRSpriteNode(imageNamed: "MenuBtnRank")
        btnRank.name = "MenuBtnRank"
        btnRank.position = CGPoint(x:btnPlay.position.x, y:btnPlay.position.y - btnPlay.size.height - 20)
        
        self.addChild(btnPlay)
        self.addChild(btnRank)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Check in the touched location if there is any interactive Node. If there is, get only the first node of the first touch.
        if let firstTouch = touches.first, firstNode = self.getFirstSpriteNodeAt(firstTouch.locationInNode(self)) {
            // Get the name of the node to determine what should happen now.
            if let nodeName = firstNode.name {
                switch (nodeName) {
                    case "MenuBtnJogar":
                        // Request a change scene
                        let userInfo = ["btnActionName": "ChangeScene", "SceneName": SceneName.WorldMap.rawValue]
                        NSNotificationCenter.defaultCenter().postNotificationName("ButtonPressed", object: self, userInfo: userInfo)
                        break
                    case "MenuBtnRank":
                        // Request a change scene
                        let userInfo = ["btnActionName": "ChangeScene", "SceneName": SceneName.Rank.rawValue]
                        NSNotificationCenter.defaultCenter().postNotificationName("ButtonPressed", object: self, userInfo: userInfo)
                        break
                    default:
                        print("Error! No action set to this Node named: " + nodeName)
                        break
                }
            } else {
                print("Error! No action set to this Node without name")
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
