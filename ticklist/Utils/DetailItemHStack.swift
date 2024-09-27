//
//  SwiftUIView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 16/09/2024.
//

import SwiftUI

struct DetailItemHStack<Content: View>: View {
    
    @Environment(\.editMode) private var editMode
    
    let description: String
    @ViewBuilder var content: Content
    
    private var disableContent: Bool {
        editMode?.wrappedValue.isEditing == false
    }
    
    var body: some View {
        HStack {
            Text(description)
                .bold()
            Spacer()
            content
                .multilineTextAlignment(.trailing)
                .disabled(disableContent)
        }
    }
}

#Preview {
    Form {
        DetailItemHStack(description: "Description"){
//            TextEditor(text: .constant("content"))
            TextField("Content", text: .constant("content"))
        }
        .padding()
    }
}
