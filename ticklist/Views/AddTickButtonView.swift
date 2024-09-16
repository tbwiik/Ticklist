//
//  AddTickButtonView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI

struct AddTickButtonView: View {
    
    /// Detect whether view is disabled
    @Environment(\.isEnabled) var isEnabled
    
    /// Action triggered by button tap
    let action: () -> Void
    
    /// SF symbol systemname for icon on button
    var iconSystemName = "plus"
    
    var body: some View {
        VStack {
            Button(action: action){
                ZStack {
                    Rectangle()
                        .fill(isEnabled ? .green : .gray)
                        .clipShape(.buttonBorder)
                        .frame(maxWidth: .infinity)
                        .frame(height: 64)
                        .padding()
                    Image(systemName: iconSystemName)
                        .foregroundStyle(.white)
                        .font(.system(size: 32))
                        .bold()
                }
            }
        }
    }
}

#Preview {
    AddTickButtonView(action: {})
}
