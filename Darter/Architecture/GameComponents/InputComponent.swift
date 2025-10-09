//
//  InputComponent.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/2/25.
//

import Foundation
import GameplayKit

class InputComponent: GKComponent {
    
    let horizontalSpeed :CGFloat = 200
    let jumpImpulse :CGFloat = 500
    
    func applyDirectionalMovement(direction: CGVector) {
        guard let player = entity as? Player else { return }
        
        if let physicsComponent = player.component(ofType: PhysicsComponent.self) {
            
            let desiredVX = direction.dx * horizontalSpeed
            
            let currentVY = physicsComponent.physicsBody.velocity.dy
            
            physicsComponent.physicsBody.velocity = CGVector(dx: desiredVX, dy: currentVY)
        }
        
        if let renderComponent = player.component(ofType: RenderComponent.self) {
            if direction.dx < 0 {
                renderComponent.spriteNode.xScale = -1.0
            } else if direction.dx > 0 {
                renderComponent.spriteNode.xScale = 1.0
            }
        }
    }
    
    func applyJump() {
        guard let player = entity as? Player else { return }
        
        if let physicsComponent = player.component(ofType: PhysicsComponent.self) {
            // **TODO:** Will first check if the player is "on the ground"
            physicsComponent.applyJumpImpulse()
        }
    }
    
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

