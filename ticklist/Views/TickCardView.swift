//
//  TickCardView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI

struct TickCardView: View {
    var body: some View {
        HStack{
            Label("Tick", systemImage: "checkmark.circle")
            VStack (alignment: .leading) {
                Text("This is a test card")
                Text("This is a test card")
            }
            .padding()
            
        }
    }
}

#Preview {
    TickCardView()
}
