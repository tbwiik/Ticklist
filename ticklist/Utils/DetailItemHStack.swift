//
//  SwiftUIView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 16/09/2024.
//

import SwiftUI

struct DetailItemHStack: View {
    
    let description: String
    let content: String
    
    var body: some View {
        HStack {
            Text(description)
                .bold()
            Spacer()
            Text(content)
        }
    }
}

#Preview {
    Form {
        DetailItemHStack(description: "Description", content: "Content")
            .padding()
    }
}
