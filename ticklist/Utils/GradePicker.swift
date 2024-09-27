//
//  GradePicker.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 13/09/2024.
//

import SwiftUI

struct GradePicker: View {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 8
        static let padding : CGFloat = 8
        static let inputBackgroundColor = Color(UIColor.systemGray5)
    }
    
    @Binding var grade: Grade
    
    init(_ grade: Binding<Grade>) {
        self._grade = grade
    }
    
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
            .background(Constants.inputBackgroundColor)
            .tint(.black)
            .cornerRadius(Constants.cornerRadius)
            .padding(Constants.padding)
            .labelsHidden()
        }
    }
}

#Preview {
    GradePicker(.constant(Grade(FrenchClimbingGrades.grade6a)))
}
