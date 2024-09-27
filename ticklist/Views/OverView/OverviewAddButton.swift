//
//  OverviewAddButton.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 27/09/2024.
//

import SwiftUI

struct OverviewAddButton: View {
    
    //MARK: - Properties
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var isAddingClimb: Bool
    
    private enum Constants {
        static let backgroundSheetColorLight = Color(UIColor.systemGray6)
        static let backgroundSheetColorDark = Color(UIColor.systemGray3)
    }
    
    //MARK: - Computed Properties
    private var backgroundSheetColor: Color {
        colorScheme == .light ? Constants.backgroundSheetColorLight : Constants.backgroundSheetColorDark
    }
    
    //MARK: - View Body
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
        .preferredColorScheme(.light)
}
