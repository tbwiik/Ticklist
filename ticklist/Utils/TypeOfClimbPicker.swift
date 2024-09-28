//
//  TypeOfClimbPicker.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 28/09/2024.
//

import SwiftUI

struct TypeOfClimbPicker: View {
    //MARK: - Properties
    @Binding var typeOfClimb: TypeOfClimb
    
    //MARK: - View Body
    var body: some View {
        Picker("Type of Climb", selection: $typeOfClimb) {
            ForEach(TypeOfClimb.allCases) { type in
                Text(type.shortDescription).tag(type)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    Form {
        TypeOfClimbPicker(typeOfClimb: .constant(TypeOfClimb.defaultValue))
    }
}
