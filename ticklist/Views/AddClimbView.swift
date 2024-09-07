//
//  AddClimbView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 07/09/2024.
//

import SwiftUI

struct AddClimbView: View {
    
    @State var climbName: String = ""
    @State var cragName: String = ""
    @State var timeOfClimb: Date = Date.now
    @State var grade: FrenchClimbingGrades = .grade6a
    @State var climbDescription: String = ""
    
    let onButtonTap: () -> Void
    
    var body: some View {
        
        List {
            TextField("Climb Name", text: $climbName)
                .textFieldStyle(.roundedBorder)
            TextField("Crag Name", text: $cragName)
                .textFieldStyle(.roundedBorder)
            DatePicker("Time of Climb", selection: $timeOfClimb)
                .datePickerStyle(.compact)
            Picker("Grade of Climb", selection: $grade) {
                ForEach(FrenchClimbingGrades.allCases) { grade in
                    Text(grade.rawValue).tag(grade)
                }
            }
            TextField("Climb Description", text: $climbDescription)
                .textFieldStyle(.roundedBorder)
        }
        AddTickButtonView(action: onButtonTap, iconSystemName: "checkmark")
        
    }
}

#Preview {
    AddClimbView(onButtonTap: {})
}
