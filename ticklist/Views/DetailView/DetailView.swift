//
//  DetailView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 14/09/2024.
//

import SwiftUI

struct DetailView: View {
    //MARK: - Properties
    @Environment(\.editMode) private var editMode
    @Bindable var tick: Tick
    @State private var temp = "tmp"
    @FocusState private var focusOnFirst: Bool
    
    //MARK: - Computed Properties
    private var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }
    
    //MARK: - View Body
    var body: some View {
        Form {
            Section(header: Text("Climb Details")) {
                DetailItemHStack(description: "Name") {
                    TextField("", text: $tick.climbName)
                        .padding(.trailing)
                        .focused($focusOnFirst)
                }
                DetailItemHStack(description: "Crag"){
                    TextField("", text: $tick.cragName)
                        .padding(.trailing)
                }
                TypeOfClimbDetailItem(typeOfClimb: $tick.typeOfClimb)
                GradeDetailItem($tick.grade)
                DetailItemHStack(description: "Date"){
                    ClimbDatePicker($tick.timeOfClimb)
                        .labelsHidden()
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
                EditButton()
            }
        }
        .onChange(of: isEditing) { oldValue, newValue in
            focusOnFirst = newValue
        }
    }
}

#Preview {
    @Previewable @State var mock = Tick(climbName: "Silence", cragName: "Hanshelleren", timeOfClimb: .now, typeOfClimb: TypeOfClimb.boltedSinglepitch, grade: Grade(FrenchClimbingGrades.grade9c), comment: "Hardest climb ever whenever you sing to me tonight")
    NavigationStack {
        DetailView(tick: mock)
    }
}
