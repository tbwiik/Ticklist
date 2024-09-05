//
//  OverView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI

struct OverView: View {
    
    @State var text: String
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack{
                    List {
                        ForEach(0..<10) { _ in
                            TickCardView()
                        }
                    }
                    .searchable(text: $text)
                }
                VStack {
                    Spacer()
                    AddTickButtonView(action: {})
                        .background(Color.white)
                }
            }
        }
        .navigationTitle("Ticklist")
    }
}

#Preview {
    OverView(text: "Silence")
}
