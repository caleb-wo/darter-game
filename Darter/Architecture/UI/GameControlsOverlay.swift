//
//  GameControlsOverlay.swift
//  Darter
//
//  Created by Caleb Wolfe on 10/14/25.
//

import SwiftUI

struct GameControlsOverlay: View {
    @StateObject var inputManager = GameInputManager()
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                MovementJoystick(inputManager: inputManager)
                    .padding(10)

                Spacer()
                
                JumpButton(inputManager: inputManager)
                    .padding(15)
                    .padding(.bottom, -15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    GameControlsOverlay()
}
