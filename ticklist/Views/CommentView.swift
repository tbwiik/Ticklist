//
//  CommentView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 27/09/2024.
//

import SwiftUI

struct CommentView: View {
    
    @Environment(\.editMode) private var editMode
    
    @Binding var comment: String
    
    private var disableContent: Bool {
        editMode?.wrappedValue.isEditing == false
    }
    
    var body: some View {
        VStack{
            TextEditor(text: $comment)
                .disabled(disableContent)
                .padding()
        }
        .navigationTitle("Comment")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
}

#Preview {
    NavigationStack {
        CommentView(comment: .constant("Something to say"))
    }
}
