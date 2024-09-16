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
            
            HStack {
                Text("Name")
                Spacer()
                Text(tick.climbName)
            }
            HStack {
                Text("Crag")
                Spacer()
                Text(tick.cragName)
            }
            HStack {
                Text("Grade")
                Spacer()
                Text(tick.grade.string)
            }
        }
    }
}

#Preview {
    @Previewable @State var mock = Tick(climbName: "Silence", cragName: "Hanshelleren", timeOfClimb: .now, grade: Grade(FrenchClimbingGrades.grade9c), comment: "Hardest climb ever")
    DetailView(tick: $mock)
}
