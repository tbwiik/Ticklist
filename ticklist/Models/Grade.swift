//
//  Grade.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 13/09/2024.
//

import Foundation
import SwiftData

@Model
class Grade: Identifiable, Hashable, Equatable {
    var id: UUID
    var value: FrenchClimbingGrades
    
    init(_ value: FrenchClimbingGrades) {
        self.id = UUID()
        self.value = value
    }
    
    init() {
        self.id = UUID()
        self.value = FrenchClimbingGrades.defaultValue
    }
}
