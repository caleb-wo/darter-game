//
//  GameViewController.swift
//  Darter
//
//  Created by Caleb Wolfe on 9/30/25.
//

import UIKit
import SpriteKit
import GameplayKit
import SwiftUI

class GameViewController: UIViewController {
    let inputManager = GameInputManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GKScene(fileNamed: "GameScene") {
            
            if let sceneNode = scene.rootNode as! GameScene? {
                
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                sceneNode.scaleMode = .aspectFill
                
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
                
                sceneNode.inputManager = self.inputManager
                
                
                let controlsView = GameControlsOverlay(inputManager: self.inputManager)
                
                let hostingController = UIHostingController(rootView: controlsView)
                
                hostingController.view.backgroundColor = .clear // Make the background transparent
                hostingController.view.frame = view.bounds // Cover the entire screen
                
                addChild(hostingController)
                view.addSubview(hostingController.view)
                hostingController.didMove(toParent: self)
                
                hostingController.view.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                    hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ])
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
