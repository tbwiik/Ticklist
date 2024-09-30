//
//  SwiftUIView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 16/09/2024.
//

import SwiftUI

struct DetailItemHStack<Content: View>: View {
    //MARK: - Properties
    @Environment(\.editMode) private var editMode
    
    let description: String
    @ViewBuilder var content: Content
    
    //MARK: - Computed Properties
    private var disableContent: Bool {
        editMode?.wrappedValue.isEditing == false
    }
    
    //MARK: - View Body
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
    NavigationStack {
        Form {
            EditButton()
            DetailItemHStack(description: "Type"){
                //            TextEditor(text: .constant("content"))
//                            TextField("Content", text: .constant("content"))
            }
            .padding()
        }
    }
}
