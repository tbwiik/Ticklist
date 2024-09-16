//
//  Tick.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import Foundation
import SwiftData

@Model
class Tick: Identifiable {
    
    // MARK: - Variables
    var id = UUID()
    var climbName: String
    var cragName: String
    var timeOfClimb: Date
    var grade: Grade
    var comment: String
    
    // MARK: - Initializers
    init (climbName: String, cragName: String, timeOfClimb: Date, grade: Grade, comment: String) {
        self.climbName = climbName
        self.cragName = cragName
        self.timeOfClimb = timeOfClimb
        self.grade = grade
        self.comment = comment
    }
    
    init() {
        self.climbName = ""
        self.cragName = ""
        self.timeOfClimb = Date.now
        self.grade = Grade(FrenchClimbingGrades.defaultValue)
        self.comment = ""
    }
    
    // MARK: - Functions
    var isComplete: Bool {
        !climbName.isEmpty && !cragName.isEmpty
    }
}

///Date formatting
extension Date{
    func formatDate() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
}
