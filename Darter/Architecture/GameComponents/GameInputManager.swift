//
//  GameInputManager.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/14/25.
//

import Foundation
import Combine
import CoreGraphics

class GameInputManager: ObservableObject{
    var jumpAction: (()-> Void)?
    var directionalAction: ((CGVector)-> Void)?
    
    func handleJump(){
        jumpAction?()
    }
    
    func handleDirectionalInput(direction: CGVector){
        directionalAction?(direction)
    }
}
