//
//  FormField.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 27/09/2024.
//

import SwiftUI

struct FormField: View {
    //MARK: - Properties
    let label: String
    @Binding var text: String
    
    private enum Constants {
        static let padding: CGFloat = 8
    }
    
    //MARK: - Initializers
    init(_ label: String, text: Binding<String>) {
        self.label = label
        self._text = text
    }
    
    //MARK: - View Body
    var body: some View {
        HStack {
            TextField(label, text: $text)
                .multilineTextAlignment(.leading)
                .padding(Constants.padding)
                .background(InputFieldBackground())
        }
    }
}

#Preview {
    FormField("climb", text: .constant("fill inn text"))
}
