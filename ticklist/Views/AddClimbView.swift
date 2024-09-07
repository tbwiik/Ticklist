//
//  AddClimbView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 07/09/2024.
//

import SwiftUI

struct AddClimbView: View {
    
    @Binding var tick: Tick
    
    let onButtonTap: () -> Void
    
    var body: some View {
        
        List {
            TextField("Climb Name", text: $tick.climbName)
                .textFieldStyle(.roundedBorder)
            TextField("Crag Name", text: $tick.cragName)
                .textFieldStyle(.roundedBorder)
            DatePicker("Time of Climb", selection: $tick.timeOfClimb)
                .datePickerStyle(.compact)
            Picker("Grade of Climb", selection: $tick.grade) {
                ForEach(FrenchClimbingGrades.allCases) { grade in
                    Text(grade.rawValue).tag(grade)
                }
            }
            TextField("Climb Description", text: $tick.comment)
                .textFieldStyle(.roundedBorder)
        }
        AddTickButtonView(action: onButtonTap, iconSystemName: "checkmark")
        
    }
}

#Preview {
    AddClimbView(tick: .constant(Tick()), onButtonTap: {})
}
