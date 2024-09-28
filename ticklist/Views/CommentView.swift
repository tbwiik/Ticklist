//
//  CommentView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 27/09/2024.
//

import SwiftUI

struct CommentView: View {
    //MARK: - Properties
    @Environment(\.editMode) private var editMode
    @FocusState private var focusOnTextEditor: Bool
    
    @Binding var comment: String
    
    //MARK: - Computed Properties
    private var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }
    
    //MARK: - View Body
    var body: some View {
        VStack{
            TextEditor(text: $comment)
                .disabled(!isEditing)
                .focused($focusOnTextEditor)
                .padding()
        }
        .navigationTitle("Comment")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
        .onChange(of: isEditing) { oldValue, newValue in
            focusOnTextEditor = newValue
        }
    }
}

#Preview {
    NavigationStack {
        CommentView(comment: .constant("Something to say"))
    }
}
