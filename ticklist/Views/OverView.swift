//
//  OverView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI

struct OverView: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.black)
            VStack {
                Spacer()
                AddTickButtonView(action: {})
                    .background(Color.white)
            }
        }
    }
}

#Preview {
    OverView()
}
