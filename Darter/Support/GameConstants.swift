//
//  GameConstance.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/2/25.
//

import Foundation

public enum CollisionCategory: UInt32 {
    case character = 0b0001
    case structure = 0b0010
    case projectile = 0b0011
}
