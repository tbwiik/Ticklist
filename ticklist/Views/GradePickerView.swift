//
//  GradePickerView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 13/09/2024.
//

import SwiftUI

struct GradePickerView: View {
    
    @Binding var grade: Grade
    
    var body: some View {
        HStack{
            Text("Grade")
            Spacer()            
            Picker("Grade of Climb", selection: $grade.value) {
                ForEach(FrenchClimbingGrades.allCases){ grade in
                    Text(grade.rawValue).tag(grade)
                }
            }
            .pickerStyle(.menu)
            .background(Color(UIColor.systemGray5))
            .tint(.black)
            .cornerRadius(8)
            .padding(8)
            .labelsHidden()
        }
    }
}

#Preview {
    GradePickerView(grade: .constant(Grade(FrenchClimbingGrades.grade6a)))
}
