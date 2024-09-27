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
    @FocusState private var focus: Bool
    
    let onButtonTap: () -> Void
    
    //MARK: - View Body
    var body: some View {
        List {
            FormField("Climb Name", text: $tick.climbName)
                .focused($focus)
            FormField("Crag Name", text: $tick.cragName)
            ClimbDatePicker($tick.timeOfClimb)
            GradePicker($tick.grade)
            FormField("Comment", text: $tick.comment)
        }
        .listStyle(.inset)
        .padding()
        .onAppear() { focus = true }
        Spacer()
        AddTickButtonView(buttonTap: onButtonTap, iconSystemName: "checkmark")
            .disabled(!tick.isComplete)
    }
}

#Preview {
    Text("")
        .sheet(isPresented: .constant(true)){
            NavigationStack {
                AddClimbView(tick: .constant(Tick()), onButtonTap: {})
                    .presentationDragIndicator(.visible)
                    .presentationDetents(.init([.medium]))
            }
        }
}
