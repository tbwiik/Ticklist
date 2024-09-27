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
        static let padding : CGFloat = 8
        static let gradeSystemColor = Color.gray
        static let gradeButtonColor = Color.black
        static let separator = Color.white
    }
    
    //MARK: - Initializers
    init(_ grade: Binding<Grade>) {
        self._grade = grade
    }
    
    //MARK: - View Body
    var body: some View {
        HStack {
            Text("Grade of Climb")
                .truncationMode(.tail)
                .layoutPriority(2)
            Spacer()
            HStack {
                Text("French")
                    .foregroundStyle(Constants.gradeSystemColor)
                    .padding(.leading)
                Rectangle().frame(width: 2).foregroundStyle(Constants.separator)
                Picker("Grade of Climb", selection: $grade.value) {
                    ForEach(FrenchClimbingGrades.allCases){ grade in
                        Text(grade.rawValue).tag(grade)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                .tint(Constants.gradeButtonColor)
                .padding(.trailing)
            }
            .background(InputFieldBackground())
            .layoutPriority(1)
            .lineLimit(1)
        }
    }
}

#Preview {
    
    @Previewable @State var grade: Grade = .init(FrenchClimbingGrades.grade6aPlus)
    
    List {
        NavigationStack {
            GradePicker($grade)
        }
    }
}
