//
//  TickCardView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI

struct TickCardView: View {
    
    private let tickImage = "mountain.2"
    
    let tick: Tick
    
    init(_ tick: Tick) {
        self.tick = tick
    }
    
    var body: some View {
        HStack{
            Label(tick.grade.string, systemImage: tickImage)
                .font(.title2) // TODO: update
            VStack (alignment: .leading) {
                Text(tick.climbName)
                    .font(.headline) // TODO: update
                Text(tick.cragName)
            }
            .padding()
            
        }
    }
}

#Preview {
    TickCardView(Tick.mockSilence)
}
