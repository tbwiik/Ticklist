//
//  SwiftUIView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 16/09/2024.
//

import SwiftUI

struct DetailItemHStack<Content: View>: View {
    
    let description: String
    var disableContent: Bool = false
    var content: () -> Content
    
    var body: some View {
        HStack {
            Text(description)
                .bold()
            Spacer()
            content()
                .fixedSize(horizontal: true, vertical: false)
                .disabled(disableContent)
        }
    }
}

#Preview {
    Form {
        DetailItemHStack(description: "Description"){
            TextField("Content", text: .constant("content"))
        }
        .padding()
    }
}
