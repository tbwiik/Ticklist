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
            Button(action: {action()}){
                ZStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(isEnabled ? .green : .gray)
                        .font(.system(size: 40))
                    Image(systemName: iconSystemName)
                        .foregroundStyle(.white)
                        .font(.system(size: 22))
                        .bold()
                }
            }
        }
    }
}

#Preview {
    AddTickButtonView(action: {})
}
