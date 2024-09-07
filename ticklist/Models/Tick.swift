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
    var grade: FrenchClimbingGrades
    var comment: String
    
    // MARK: - Initializers
    init (climbName: String, cragName: String, timeOfClimb: Date, grade: FrenchClimbingGrades, comment: String) {
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
        self.grade = .defaultValue
        self.comment = ""
    }
    
    // MARK: - Computed Properties
    var gradeString: String {
        grade.rawValue
    }
    
    // MARK: - Functions
    var isComplete: Bool {
        !climbName.isEmpty && !cragName.isEmpty
    }
}
