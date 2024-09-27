//
//  InputFieldBackground.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 27/09/2024.
//

import SwiftUI

struct InputFieldBackground: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 10
        static let inputBackgroundColor: Color = Color(UIColor.systemGray6)
    }
    
    var body: some View {
        Rectangle()
            .fill(Constants.inputBackgroundColor)
            .clipShape(.rect(cornerRadius: Constants.cornerRadius))
    }
}

#Preview {
    List {
        InputFieldBackground()
    }
}
