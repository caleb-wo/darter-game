//
//  PhysicsComponent.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/1/25.
//

import Foundation
import SpriteKit
import GameplayKit

/// Main physics component. Currently only
/// serves player entity.
class PhysicsComponent: GKComponent{
    let physicsBody: SKPhysicsBody
    
    init(size: CGSize, category: CollisionCategory){
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody.mass = 0.5
        self.physicsBody.affectedByGravity = true
        self.physicsBody.categoryBitMask = category.rawValue
        
        super.init()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) not implemented.")
    }
    
    /// Runs when added to entity. Wires the physics
    /// component "self" to the entity sprite node.
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
