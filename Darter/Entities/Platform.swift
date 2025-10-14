//
//  Platform.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/14/25.
//

import Foundation
import GameplayKit
import SpriteKit

class Platform: GKEntity{
    var spriteNode: SKSpriteNode? {
        return component(ofType: RenderComponent.self)?.spriteNode
    }
    
    /// Prototyping init. Creates entity
    /// of size in color green.
    /// - Parameter startingPoint: location where the
    /// entity will be created.
    /// - Parameter size: shape of the platform.
    init(at startingPoint: CGPoint, in size: CGSize){
        let renderComponent = RenderComponent(color: .green, in: size)
        renderComponent.spriteNode.position = startingPoint
        
        let physicsComponent = PhysicsComponent(size: size, category: .structure, buildType: .absolute)
        physicsComponent.physicsBody.collisionBitMask = CollisionCategory.character.rawValue

        super.init() // GKEntity must be initialized before components can be added.
        addComponent(renderComponent)
        addComponent(physicsComponent)
        addComponent(InputComponent())
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    

}
