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

class Player: GKEntity{
    var spriteNode: SKSpriteNode? {
        return component(ofType: RenderComponent.self)?.spriteNode
    }
    
    init(start startingPoint: CGPoint){
        let size = CGSize(width: 30, height: 30)
        let renderComponent = RenderComponent(color: .blue, in: size)
        renderComponent.spriteNode.position = startingPoint
        
        let physicsComponent = PhysicsComponent(size: size, category: .character)
        
        super.init()
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


