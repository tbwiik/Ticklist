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
    
    @Binding var comment: String
    
    //MARK: - Computed Properties
    private var disableContent: Bool {
        editMode?.wrappedValue.isEditing == false
    }
    
    //MARK: - View Body
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
