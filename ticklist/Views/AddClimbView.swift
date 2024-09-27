//
//  AddClimbView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 07/09/2024.
//

import SwiftUI

struct AddClimbView: View {
    //MARK: - Properties
    @Binding var tick: Tick
    
    let onButtonTap: () -> Void
    
    //MARK: - View Body
    var body: some View {
        List {
            FormField("Climb Name", text: $tick.climbName)
            FormField("Crag Name", text: $tick.cragName)
            ClimbDatePicker($tick.timeOfClimb)
            GradePicker($tick.grade)
            FormField("Comment", text: $tick.comment)
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
