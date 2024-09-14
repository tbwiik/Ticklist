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
        
        VStack {
            TextField("Climb Name", text: $tick.climbName)
                .textFieldStyle(.roundedBorder)
            TextField("Crag Name", text: $tick.cragName)
                .textFieldStyle(.roundedBorder)
            DatePicker("Time of Climb", selection: $tick.timeOfClimb)
                .datePickerStyle(.compact)
            GradePickerView(grade: $tick.grade)
            TextField("Climb Description", text: $tick.comment)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .navigationBarTitle("Add Climb")
        Spacer()
        AddTickButtonView(action: onButtonTap, iconSystemName: "checkmark")
            .disabled(!tick.isComplete)
        
    }
}

#Preview {
    AddClimbView(tick: .constant(Tick()), onButtonTap: {})
}
