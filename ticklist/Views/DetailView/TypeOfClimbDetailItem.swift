//
//  TypeOfClimbDetailItem.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 28/09/2024.
//

import SwiftUI

struct TypeOfClimbDetailItem: View {
    //MARK: - Properties
    @Environment(\.editMode) private var editMode
    @Binding var typeOfClimb: TypeOfClimb
    
    //MARK: - Computed Properties
    private var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }
    
    var body: some View {
        DetailItemHStack(description: "Type"){
            if isEditing {
                TypeOfClimbPicker(typeOfClimb: .constant(TypeOfClimb.defaultValue))
                    .labelsHidden()
                    .pickerStyle(.menu)
            } else {
                Text(typeOfClimb.description)
            }
        }
    }
}

#Preview {
    Form {
        EditButton()
        TypeOfClimbDetailItem(typeOfClimb: .constant(TypeOfClimb.boltedSinglepitch))
    }
}
