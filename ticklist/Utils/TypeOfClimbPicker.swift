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
    var doShortDescription = true
    
    //MARK: - View Body
    var body: some View {
        Picker(selection: $typeOfClimb) {
            ForEach(TypeOfClimb.allCases) { type in
                Text(doShortDescription ? type.shortDescription : type.description).tag(type)
            }
        } label: {
            Text("Type of Climb").bold()
        }
    }
}

#Preview {
    Form {
        TypeOfClimbPicker(typeOfClimb: .constant(TypeOfClimb.boltedSinglepitch))
            .pickerStyle(.segmented)
    }
}
