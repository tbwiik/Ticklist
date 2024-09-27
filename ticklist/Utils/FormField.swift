//
//  FormField.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 27/09/2024.
//

import SwiftUI

struct FormField: View {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 10
        static let inputBackgroundColor: Color = .gray.opacity(0.2)
    }
    
    let label: String
    @Binding var text: String
    
    init(_ label: String, text: Binding<String>) {
        self.label = label
        self._text = text
    }
    
    var body: some View {
        HStack {
            TextField(label, text: $text)
                .multilineTextAlignment(.leading)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .fill(Constants.inputBackgroundColor)
                )
        }
    }
}

#Preview {
    FormField("climb", text: .constant("fill inn text"))
}
