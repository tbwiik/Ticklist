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
    @State var grade: String = ""
    @State var climbDescription: String = ""
    
    var body: some View {
        
        VStack {
            TextField("Climb Name", text: $climbName)
                .textFieldStyle(.roundedBorder)
            TextField("Crag Name", text: $cragName)
                .textFieldStyle(.roundedBorder)
            DatePicker("Time of Climb", selection: $timeOfClimb)
                .datePickerStyle(.compact)
            TextField("Grade of Climb", text: $grade)
                .textFieldStyle(.roundedBorder)
            TextField("Climb Description", text: $climbDescription)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        
    }
}

#Preview {
    AddClimbView()
}
