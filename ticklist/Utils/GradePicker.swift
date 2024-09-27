//
//  GradePicker.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 13/09/2024.
//

import SwiftUI

struct GradePicker: View {
    //MARK: - Properties
    @Binding var grade: Grade
    
    private enum Constants {
        static let cornerRadius: CGFloat = 8
        static let padding : CGFloat = 8
        static let inputBackgroundColor = Color(UIColor.systemGray6)
    }
    
    //MARK: - Initializers
    init(_ grade: Binding<Grade>) {
        self._grade = grade
    }
    
    //MARK: - View Body
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
            .labelsHidden()
        }
    }
}

#Preview {
    GradePicker(.constant(Grade(FrenchClimbingGrades.grade6a)))
}
