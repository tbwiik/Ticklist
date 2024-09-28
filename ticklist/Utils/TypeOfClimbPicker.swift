//
//  TypeOfClimbPicker.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 28/09/2024.
//

import SwiftUI

struct TypeOfClimbPicker: View {
    //MARK: - Properties
    @Environment(\.isEnabled) private var isEnabled
    @Binding var typeOfClimb: TypeOfClimb
    
    //MARK: - View Body
    var body: some View {
        if isEnabled {
            TypeOfClimbPickerEnabled(typeOfClimb: $typeOfClimb)
        } else {
            TypeOfClimbPickerDisabled(typeOfClimb: typeOfClimb)
        }
    }
}

private struct TypeOfClimbPickerEnabled: View {
    @Binding var typeOfClimb: TypeOfClimb
   
    var body: some View {
        Picker("Type of Climb", selection: $typeOfClimb) {
            ForEach(TypeOfClimb.allCases) { type in
                Text(type.shortDescription).tag(type)
            }
        }
        .pickerStyle(.segmented)
    }
}

private struct TypeOfClimbPickerDisabled: View {
    let typeOfClimb: TypeOfClimb
    
    var body: some View {
        Text(typeOfClimb.description)
    }
}

#Preview {
    Form {
        TypeOfClimbPicker(typeOfClimb: .constant(TypeOfClimb.defaultValue))
            .disabled(false)
    }
}
