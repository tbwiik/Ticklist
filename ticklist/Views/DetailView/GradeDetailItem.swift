//
//  GradeDetailItem.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 30/09/2024.
//

import SwiftUI

struct GradeDetailItem: View {
    
    @Environment(\.editMode) private var editMode
    @Binding var grade: Grade
    
    init(_ grade: Binding<Grade>) {
        self._grade = grade
    }
    
    private var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }
    
    var body: some View {
        DetailItemHStack(description: "Grade"){
            if isEditing {
                GradePicker($grade)
            } else {
                Text("French " + grade.string)
            }
        }
    }
}

#Preview {
    Form {
        EditButton()
        GradeDetailItem(.constant(Grade(FrenchClimbingGrades.defaultValue)))
    }
}
