//
//  TicklistSchemaV1.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 28/09/2024.
//

import Foundation
@preconcurrency import SwiftData

enum TicklistSchemaV1: VersionedSchema {
    static let versionIdentifier: Schema.Version = .init(1, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [Tick.self, Grade.self]
    }
    
    @Model
    class Tick: Identifiable {
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
    
    @Model
    class Grade: Identifiable, Hashable, Equatable {
        var id: UUID
        var value: FrenchClimbingGrades
        
        init(_ value: FrenchClimbingGrades) {
            self.id = UUID()
            self.value = value
        }
        
        var string: String {
            value.rawValue
        }
    }
}
