//
//  AddClimbView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 07/09/2024.
//

import SwiftUI

struct AddClimbView: View {
    //MARK: - Properties
    @Bindable var tick: Tick
    @FocusState private var focus: Bool
    var showAdditionalInfo = true
    
    let onButtonTap: () -> Void
    
    //MARK: - View Body
    var body: some View {
        List {
            Section {
                TypeOfClimbPicker(typeOfClimb: $tick.typeOfClimb)
                    .pickerStyle(.segmented)
                FormField("Climb Name", text: $tick.climbName)
                    .focused($focus)
                FormField("Crag Name", text: $tick.cragName)
                ClimbDatePicker($tick.timeOfClimb)
                GradePicker("Grade of Climb", grade: $tick.grade)
            }
            if (showAdditionalInfo) {
                FormField("Comment", text: $tick.comment)
            }
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
                AddClimbView(
                    tick: Tick(),
                    showAdditionalInfo: true,
                    onButtonTap: {})
                    .presentationDragIndicator(.visible)
                    .presentationDetents(.init([.medium]))
            }
        }
}
