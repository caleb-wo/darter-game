//
//  JumpButton.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/14/25.
//

import SwiftUI

struct JumpButton: View {
    @State var inputManager: GameInputManager
    
    var body: some View {
        Button(action: {
            inputManager.handleJump()
        }){
            Circle()
                .fill(Color.red.opacity(0.6))
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: "arrow.up")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                )
        }
    }
}

#Preview {
    @Previewable @State var inputManager = GameInputManager()
    JumpButton(inputManager: inputManager)
}
