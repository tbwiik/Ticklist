//
//  DetailView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 14/09/2024.
//

import SwiftUI

struct DetailView: View {
    //MARK: - Properties
    @Bindable var tick: Tick
    @State var showEditSheet: Bool = false
    
    //MARK: - View Body
    var body: some View {
        Form {
            Section(header: Text("Climb Details")) {
                DetailItemHStack(description: "Name") {
                    Text(tick.climbName)
                        .padding(.trailing)
                }
                DetailItemHStack(description: "Crag"){
                    Text(tick.cragName)
                        .padding(.trailing)
                }
                DetailItemHStack(description: "Type"){
                    Text(tick.typeOfClimb.description)
                        .padding(.trailing)
                }
                DetailItemHStack(description: "Grade") {
                    GradePicker($tick.grade)
                        .padding(.trailing)
                        .disabled(true)
                }
                DetailItemHStack(description: "Date"){
                    ClimbDatePicker($tick.timeOfClimb)
                        .labelsHidden()
                        .disabled(true)
                }
            }
            Section(header: Text("Additional info")) {
                NavigationLink {
                    CommentView(comment: $tick.comment)
                } label: {
                    DetailItemHStack(description: "Comment") {
                        Text(tick.comment)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                }
            }
        }
        .navigationTitle(tick.climbName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button("Edit"){ showEditSheet = true }
                    .padding(.trailing)
            }
        }
        .sheet(isPresented: $showEditSheet) {
            AddClimbView(tick: tick, onButtonTap: {})
        }
    }
}

#Preview {
    @Previewable @State var mock = Tick(climbName: "Silence", cragName: "Hanshelleren", timeOfClimb: .now, typeOfClimb: TypeOfClimb.boltedSinglepitch, grade: Grade(FrenchClimbingGrades.grade9c), comment: "Hardest climb ever whenever you sing to me tonight")
    NavigationStack {
        DetailView(tick: mock)
    }
}
