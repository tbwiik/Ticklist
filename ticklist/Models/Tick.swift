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
    
    var id: UUID
    var climbName: String
    var cragName: String
    var timeOfClimb: Date
    var grade: String // TODO: update
    var comment: String
    
    
    init (climbName: String, cragName: String, timeOfClimb: Date, grade: String, comment: String) {
        self.id = UUID()
        self.climbName = climbName
        self.cragName = cragName
        self.timeOfClimb = timeOfClimb
        self.grade = grade
        self.comment = comment
    }
    
    init() {
        self.id = UUID()
        self.climbName = ""
        self.cragName = ""
        self.timeOfClimb = Date.now
        self.grade = ""
        self.comment = ""
    }
}
