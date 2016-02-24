//
//  GameViewController.swift
//  DragonsRageSwift
//
//  Created by Filipe Kunioshi on 2016-02-21.
//  Copyright (c) 2016 Filipe Kunioshi. All rights reserved.
//

import UIKit
import SpriteKit

enum SceneName: String {
    case Intro = "Intro"
    case Menu = "Menu"
    case Rank = "Rank"
    case WorldMap = "WorldMap"
    case BattleStage = "BattleStage"
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = ScnMenu(size: view.bounds.size)
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .ResizeFill
        
        skView.presentScene(scene)
        
        // Set up all Notification/Event listeners
        setupListeners()
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    /**
     Set up all `NSNotification` listeners
     */
    func setupListeners() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("pressedButton:"), name: "ButtonPressed", object: nil)
    }
    
    /**
     Determines what will happen when a button is pressed according to the arguments in the `userInfo`.
     
     To call this method the Scene should send a `NSNotification` with the name of `ButtonPressed`.
     
     To config the actions, the notification should have a `userInfo` with the field `btnActionName`.
     
     **btnActionName** list:
     - `ChangeScene`: For this action, the `userInfo` should also contain the name of the next scene for the key `SceneName`.
     */
    func pressedButton(notification: NSNotification) {
        // Get the Button's action command
        let btnActionName = notification.userInfo?["btnActionName"]
        
        // Check if it is a valid command
        if let btnActionName = btnActionName, actionName = btnActionName as? String {
            // Determine the Controller action according to the request from the button
            switch(actionName) {
                case "ChangeScene":
                    // If it is a request to change the scene, check if the requested scene is valid
                    if let userScene = notification.userInfo?["SceneName"] as? String, sceneName = SceneName(rawValue: userScene) {
                        changeSceneWithName(sceneName)
                    }
                    break
                default:
                    break
            }
        }
    }
    
    /**
     Change the current Scene to the one corresponding to the `sceneName`.
     
     - parameters:
        - sceneName: One of the registered Scene Names.
     */
    func changeSceneWithName(sceneName: SceneName) {
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 1.0)
        
        let nextScene = discoverSceneByName(sceneName)
        
        changeSceneWithTransition(nextScene, transition: transition)
    }
    
    /**
     Change the current Scene to the given `nextScene`.
     
     - parameters:
        - nextScene: One of the subclasses of `DRScene`.
     */
    func changeScene(nextScene: DRScene) {
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 1.0)
        
        changeSceneWithTransition(nextScene, transition: transition)
    }
    
    /**
     Get the `DRScene` subclass corresponding to the given `sceneName`.
     
     - parameters:
        - sceneName: One of the registered Scene Names.
     
     - returns: A `DRScene` subclass according to the given `sceneName`.
     */
    func discoverSceneByName(sceneName: SceneName) -> DRScene {
        switch(sceneName) {
            case .Intro:
                return DRScene()
            case .Menu:
                return ScnMenu()
            case .WorldMap:
                return ScnWorldMap()
            case .BattleStage:
                return DRScene()
            default:
                return ScnMenu()
        }
    }
    
    /**
     Indeed change the current scene to the given `nextScene` with the given `transition` animation.
     
     - parameters:
        - nextScene: Which scene the game should move to.
        - transition: The `SKTransition` animation that should happen when changing between the scenes.
     */
    func changeSceneWithTransition(nextScene: DRScene, transition: SKTransition) {
        nextScene.scaleMode = .ResizeFill
        
        let skView = self.view as! SKView
        skView.presentScene(nextScene, transition: transition)
    }
}
