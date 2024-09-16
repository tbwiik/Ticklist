//
//  DetailView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 14/09/2024.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var tick: Tick
    
    var body: some View {
        Form {
            Section(header: Text("Climb Details")) {
                DetailItemHStack(description: "Name", content: tick.climbName)
                DetailItemHStack(description: "Crag", content: tick.cragName)
                DetailItemHStack(description: "Grade", content: tick.grade.string)
                DetailItemHStack(description: "Date", content: tick.timeOfClimb.formatDate())
            }
            Section(header: Text("Additional info")) {
                DetailItemHStack(description: "Comment", content: tick.comment)
            }
        }
    }
}

#Preview {
    @Previewable @State var mock = Tick(climbName: "Silence", cragName: "Hanshelleren", timeOfClimb: .now, grade: Grade(FrenchClimbingGrades.grade9c), comment: "Hardest climb ever")
    DetailView(tick: $mock)
}
