//
//  GameScene.swift
//  Darter
//
//  Created by Caleb Wolfe on 9/30/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var inputManager: GameInputManager? {
        didSet {
            setupInputBridge()
        }
    }
    var player: Player!
    var platform1: Platform!
    let gameCamera = SKCameraNode()
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
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
        
        self.camera = gameCamera
        addChild(gameCamera)
        gameCamera.position = CGPoint(x: frame.midX, y: frame.midY)

        self.entities.append(self.player)
    }
    
    func setupInputBridge() {
        inputManager?.jumpAction = { [weak self] in
            self?.player?.handleJump()
        }
        print("Input Manager bridge setup complete.")
    }
    
//    override func didMove(to view: SKView) {
//    }
    
    override func update(_ currentTime: TimeInterval) {
        if let direction = inputManager?.currentDirection {
                self.player?.handleInput(direction: direction)
        }

        guard let camera = camera, let player = player.spriteNode else { return }
        let x = lerp(current: camera.position.x, target: player.position.x, speed: 0.1)
        let y = lerp(current: camera.position.y, target: player.position.y, speed: 0.1)
        camera.position = CGPoint(x: x, y: y)
        
        
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        self.lastUpdateTime = currentTime
    }
}
