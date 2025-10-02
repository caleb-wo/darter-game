//
//  RenderComponent.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/1/25.
//

import Foundation
import UIKit
import GameplayKit
import SpriteKit


/// Primary renderig component for game
/// entities.
class RenderComponent: GKComponent {
    let spriteNode: SKSpriteNode
    
    /// Main RenderComponent initializer.
    /// - Parameters:
    ///   - textureName: String name of the desired texture or asset.
    ///   - size: CGSize to confine the texture.
    init(textureName: String, in size: CGSize){
        let texture = SKTexture(imageNamed: textureName)
        self.spriteNode = SKSpriteNode(texture: texture, size: size)
        self.spriteNode.userData = NSMutableDictionary()
        
        super.init()
        self.spriteNode.userData?["component"] = self
    }
    
    
    /// Prototyping init. This takes a color instead of a texture name.
    /// Renders a color within the size.
    /// - Parameters:
    ///   - color: UIColor choice.
    ///   - size: CGSize for containing the color.
    init(color: UIColor, in size: CGSize){
        self.spriteNode = SKSpriteNode(color: color, size: size)
        self.spriteNode.userData = NSMutableDictionary()
        
        super.init()
        self.spriteNode.userData?["component"] = self
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented.")
    }
    
    func updateTexture(to newTextureName: String){
        self.spriteNode.texture = SKTexture(imageNamed: newTextureName)
    }
}
