//
//  GameScene.swift
//  Darter
//
//  Created by Caleb Wolfe on 9/30/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player: Player!
    var platform1: Platform!
    var activeDirection :CGVector = .zero
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        self.backgroundColor = SKColor.black
        
        let playerStartPos = CGPoint(x: 0, y:0)
        let platformTestPos = CGPoint(x: 0, y: -100)
        
        self.player = Player(start: playerStartPos)
        self.platform1 = Platform(at: playerStartPos, in: CGSize(width: 800, height: 50))
        
        if let playerNode = self.player.spriteNode {
            self.addChild(playerNode)
            print("Player entity added at \(playerStartPos)")
        }
        
        if let platformNode = self.platform1.spriteNode {
            self.addChild(platformNode)
            print("Platform entity added at \(platformTestPos)")
        }
        
        self.entities.append(self.player)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let player = self.player else { return }
        let location = touch.location(in: self)
        
        // 1. Clear any active movement
        self.activeDirection = .zero
        
        // 2. Check for movement vs. jump
        let leftSide = self.size.width / 3
        let rightSide = self.size.width * 0.7
        let jumpHeight = self.size.height * 0.75
        
        if location.x < leftSide {
            // Touch on the left third: Move Left
            self.activeDirection = CGVector(dx: -1.0, dy: 0)
        } else if location.x > rightSide {
            // Touch on the right third: Jump or Move Right
            if location.y > jumpHeight {
                // Touch high on the right: JUMP
                player.handleJump()
            } else {
                // Touch low on the right: Move Right
                self.activeDirection = CGVector(dx: 1.0, dy: 0)
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Stop horizontal movement when any touch ends
        self.activeDirection = .zero
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Also stop movement if the touch is interrupted
        self.activeDirection = .zero
    }
    
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//    
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//    
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//        
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//    
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        if let player = self.player {
            player.handleInput(direction: self.activeDirection)
            
        }
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        self.lastUpdateTime = currentTime
    }
}
