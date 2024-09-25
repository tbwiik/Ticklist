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
            TextField("Crag Name", text: $tick.cragName)
            ClimbDatePicker($tick.timeOfClimb)
            GradePicker($tick.grade)
            TextField("Climb Description", text: $tick.comment)
        }
        .listStyle(.inset)
        .padding()
        Spacer()
        AddTickButtonView(action: onButtonTap, iconSystemName: "checkmark")
            .disabled(!tick.isComplete)
        
    }
}

#Preview {
    Text("")
        .sheet(isPresented: .constant(true)){
            AddClimbView(tick: .constant(Tick()), onButtonTap: {})
                .presentationDragIndicator(.visible)
                .presentationDetents(.init([.medium]))
        }
}
