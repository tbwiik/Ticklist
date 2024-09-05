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
            VStack{
                HStack{
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass.circle")
                    }
                    .padding(.trailing)
                    .font(.title)
                }
                List {
                    ForEach(0..<10) { _ in
                        TickCardView()
                    }
                }
            }
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
