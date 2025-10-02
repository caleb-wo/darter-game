//
//  PhysicsComponent.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/1/25.
//

import Foundation
import SpriteKit
import GameplayKit

class PhysicsComponent: GKComponent{
    let physicsBody: SKPhysicsBody
    
    init(size: CGSize, category: UInt32){
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody.mass = 0.5
        self.physicsBody.affectedByGravity = true
        self.physicsBody.categoryBitMask = category
        
        super.init()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) not implemented.")
    }
    
    override func didAddToEntity() {
        guard let renderComponent = entity?.component(ofType: RenderComponent.self) else {
            fatalError("PhysicsComponent requires a RenderComponent on the same entity.")
        }
        
        renderComponent.spriteNode.physicsBody = physicsBody
    }
    
    func applyJumpImpulse() {
        physicsBody.velocity.dy = 0 
        physicsBody.applyImpulse(CGVector(dx: 0, dy: 500))
    }
}
