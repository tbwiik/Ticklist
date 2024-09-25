//
//  DetailView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 14/09/2024.
//

import SwiftUI

struct DetailView: View {
    
    @Bindable var tick: Tick
    var isDisabled: Bool = true
    
    var body: some View {
        Form {
            Section(header: Text("Climb Details")) {
                DetailItemHStack(description: "Name", disableContent: isDisabled) {
                    TextField("", text: $tick.climbName)
                }
                DetailItemHStack(description: "Crag", disableContent: isDisabled){
                    TextField("", text: $tick.cragName)
                }
                DetailItemHStack(description: "Grade", disableContent: isDisabled){
                    Text(tick.grade.string)
                }
                DetailItemHStack(description: "Date", disableContent: isDisabled){
                    ClimbDatePicker($tick.timeOfClimb)
                        .labelsHidden()
                }
            }
            Section(header: Text("Additional info")) {
                DetailItemHStack(description: "Comment", disableContent: isDisabled) {
                    TextEditor(text: $tick.comment)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var mock = Tick(climbName: "Silence", cragName: "Hanshelleren", timeOfClimb: .now, grade: Grade(FrenchClimbingGrades.grade9c), comment: "Hardest climb ever")
    DetailView(tick: mock)
}
