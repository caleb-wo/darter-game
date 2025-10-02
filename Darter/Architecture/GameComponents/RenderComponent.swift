//
//  RenderComponent.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/1/25.
//

import Foundation
import GameplayKit
import SpriteKit


/// Primary renderig component for game
/// entities.
class RenderComponent: GKComponent {
    let spriteNode: SKSpriteNode
    
    init(textureName: String, in size: CGSize){
        let texture = SKTexture(imageNamed: textureName)
        self.spriteNode = SKSpriteNode(texture: texture, size: size)
        
        self.spriteNode.userData = NSMutableDictionary()
        self.spriteNode.userData?["component"] = self
        
        super.init()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented.")
    }
    
    func updateTexture(to newTextureName: String){
        self.spriteNode.texture = SKTexture(imageNamed: newTextureName)
    }
}
