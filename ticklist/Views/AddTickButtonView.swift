//
//  AddTickButtonView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI

struct AddTickButtonView: View {
    //MARK: - Properties
    @Environment(\.isEnabled) var isEnabled
    
    let buttonTap: () -> Void
    
    var iconSystemName = "plus"
    
    //MARK: - View Body
    var body: some View {
        VStack {
            Button(action: buttonTap){
                ZStack {
                    Rectangle()
                        .fill(isEnabled ? .accent : .gray)
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
    AddTickButtonView(buttonTap: {})
}
