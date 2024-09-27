//
//  DetailView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 14/09/2024.
//

import SwiftUI

struct DetailView: View {
    
    @Bindable var tick: Tick
    @State private var temp = "tmp"
    
    var body: some View {
        Form {
            Section(header: Text("Climb Details")) {
                DetailItemHStack(description: "Name") {
                    TextField("", text: $tick.climbName)
                }
                DetailItemHStack(description: "Crag"){
                    TextField("", text: $tick.cragName)
                }
                DetailItemHStack(description: "Grade"){
                    Text(tick.grade.string)
                }
                DetailItemHStack(description: "Date"){
                    ClimbDatePicker($tick.timeOfClimb)
                        .labelsHidden()
                }
            }
            Section(header: Text("Additional info")) {
                NavigationLink {
                    CommentView(comment: $tick.comment)
                }
                label:
                {
                    DetailItemHStack(description: "Comment") {
                        Text(tick.comment)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                EditButton()
            }
        }
    }
}

#Preview {
    @Previewable @State var mock = Tick(climbName: "Silence", cragName: "Hanshelleren", timeOfClimb: .now, grade: Grade(FrenchClimbingGrades.grade9c), comment: "Hardest climb ever whenever you sing to me tonight")
    NavigationStack {
        DetailView(tick: mock)
    }
}
