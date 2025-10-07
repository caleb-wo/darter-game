//
//  Player.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/2/25.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreGraphics


/// Player entity
class Player: GKEntity{
    /// Computed value that checks the players componenets
    /// looking for the render component. Upon locating
    /// the component, the SpriteNode is returned.
    var spriteNode: SKSpriteNode? {
        return component(ofType: RenderComponent.self)?.spriteNode
    }
    
    /// Prototyping init. Creates entity
    /// of 32x64 in color blue.
    /// - Parameter startingPoint: location where the
    /// entity will be created.
    init(start startingPoint: CGPoint){
        let size = CGSize(width: 32, height: 64)
        let renderComponent = RenderComponent(color: .blue, in: size)
        renderComponent.spriteNode.position = startingPoint
        
        let physicsComponent = PhysicsComponent(size: size, category: .character)
        
        super.init() // GKEntity must be initialized before components can be added.
        addComponent(renderComponent)
        addComponent(physicsComponent)
//        addComponent(PlayerInputComponent())
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleInput(direction: CGVector){
//        if let input = component(ofType: InputComponent.self){
//            input.applyDirectionalMovement(direction)
//        }
    }
}


