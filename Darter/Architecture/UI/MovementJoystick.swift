//
//  MovementJoystick.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/14/25.
//  Built on the joystick tool by Medium writer, 'Tony'
//  see: https://medium.com/better-programming/creating-a-joystick-control-in-swiftui-6c63d713ab9

import SwiftUI

struct MovementJoystick: View {
    @ObservedObject var inputManager: GameInputManager
    
    @State private var thumbOffset: CGSize = .zero
    
    private let baseRadius: CGFloat = 80
    private let thumbRadius: CGFloat = 25.0
    
    var joystickDrag: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                let vector = CGVector(dx: value.translation.width, dy: value.translation.height)
                let distance = hypot(vector.dx, vector.dy)
                
                if distance > baseRadius {
                    let angle = atan2(vector.dy, vector.dx)
                    thumbOffset.width = cos(angle) * baseRadius
                    thumbOffset.height = sin(angle) * baseRadius
                } else {
                    thumbOffset = value.translation
                }
                
                let normalizedX = thumbOffset.width / baseRadius
                let normalizedY = thumbOffset.height / baseRadius
                let directionVector = CGVector(dx: normalizedX, dy: normalizedY)
                
                inputManager.handleDirectionalInput(direction: directionVector)
            }
            .onEnded { _ in
                withAnimation(.spring(response: 0.2)) {
                    thumbOffset = .zero
                }
                inputManager.handleDirectionalInput(direction: CGVector.zero)
            }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.blue.opacity(0.6))
                .frame(width: baseRadius * 2, height: baseRadius * 2)
            
            Circle()
                .fill(.purple)
                .frame(width: thumbRadius * 2, height: thumbRadius * 2)
                .offset(thumbOffset)
        }
        .frame(width: baseRadius * 2, height: baseRadius * 2)
        .gesture(joystickDrag)
    }
}

#Preview {
    @Previewable @State var inputManager = GameInputManager()
    MovementJoystick(inputManager: inputManager)
}
