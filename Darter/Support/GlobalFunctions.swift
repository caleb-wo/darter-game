//
//  GlobalFunctions.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/15/25.
//

import Foundation
import CoreGraphics

func lerp(current: CGFloat, target: CGFloat, speed: CGFloat) -> CGFloat {
    return current + (target - current) * speed
}
