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
        Picker(selection: $typeOfClimb) {
            ForEach(TypeOfClimb.allCases) { type in
                Text(type.shortDescription).tag(type)
            }
        } label: {
            Text("Type of Climb").bold()
        }

    }
}

#Preview {
    Form {
        TypeOfClimbPicker(typeOfClimb: .constant(TypeOfClimb.boltedMultipitch))
            .pickerStyle(.segmented)
    }
}
