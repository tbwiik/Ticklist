//
//  OverviewAddButton.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 27/09/2024.
//

import SwiftUI

struct OverviewAddButton: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    private enum Constants {
        static let backgroundSheetColorLight = Color.white
        static let backgroundSheetColorDark = Color(UIColor.systemGray3)
    }
    
    @Binding var isAddingClimb: Bool
    
    private var backgroundSheetColor: Color {
        colorScheme == .light ? Constants.backgroundSheetColorLight : Constants.backgroundSheetColorDark
    }
    
    var body: some View {
        VStack {
            Spacer()
            AddTickButtonView(action: { isAddingClimb = true})
                .background(backgroundSheetColor)
        }
    }
}

#Preview {
    OverviewAddButton(isAddingClimb: .constant(true))
        .preferredColorScheme(.dark)
}
