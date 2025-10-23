//
//  GameInputManager.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/14/25.
//

import Foundation
import Combine
import CoreGraphics

@Observable class GameInputManager {
    var jumpAction: (()-> Void)?
    var directionalAction: ((CGVector)-> Void)?
    var currentDirection: CGVector = .zero
    
    func handleJump(){
        jumpAction?()
    }
    
    func handleDirectionalInput(direction: CGVector){
        self.currentDirection = direction
    }
}
