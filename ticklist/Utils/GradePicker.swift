//
//  GradePicker.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 13/09/2024.
//

import SwiftUI

struct GradePicker: View {
    //MARK: - Properties
    let labelText: String?
    @Binding var grade: Grade
    @Environment(\.isEnabled) private var isEnabled
    
    //MARK: - Initializers
    init(_ grade: Binding<Grade>) {
        self._grade = grade
        self.labelText = nil
    }
    
    init(_ labelText: String, grade: Binding<Grade>) {
        self.labelText = labelText
        self._grade = grade
    }
    
    //MARK: - View Body
    var body: some View {
        HStack {
            if (labelText != nil) {
                Text(labelText!)
                    .truncationMode(.tail)
                    .layoutPriority(2)
                Spacer()
            }
            if isEnabled {
                EnabledGradePicker(grade: $grade)
            } else {
                Text("\(grade.value.systemName) \(grade.value)")
            }
        }
    }
}

struct EnabledGradePicker: View {
    
    @Binding var grade: Grade
    
    private enum Constants {
        static let padding : CGFloat = 8
        static let gradeSystemColor = Color.gray
        static let gradeButtonColor = Color.black
        static let separator = Color.white
    }
    
    var body: some View {
        HStack {
            Text(grade.value.systemName)
                .foregroundStyle(Constants.gradeSystemColor)
                .padding(.leading)
            Rectangle().frame(width: 2).foregroundStyle(Constants.separator)
            Picker("", selection: $grade.value) {
                ForEach(grade.value.systemGrades, id: \.self ){ grade in
                    Text(grade.string).tag(grade)
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

#Preview {
    
    @Previewable @State var grade: Grade = .init()
    
    List {
        NavigationStack {
            GradePicker("Grade of Climb", grade: $grade)
        }
    }
}
