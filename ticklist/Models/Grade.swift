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
    var value: String
    var systemName: String
    
    init(systemName: String, value: String) {
        self.id = UUID()
        self.systemName = systemName
        self.value = value
    }
    
    init() {
        self.id = UUID()
        self.systemName = FrenchClimbingGrades.systemName
        self.value = FrenchClimbingGrades.defaultValue
    }
    
    func getAllCasesFromSystem() -> [String] {
        switch systemName {
        case FrenchClimbingGrades.systemName:
            return FrenchClimbingGrades.allCases.map{ $0.rawValue }
        case NorwegianClimbingGrades.systemName:
            return NorwegianClimbingGrades.allCases.map{ $0.rawValue }
        case UIAAClimbingGrades.systemName:
            return UIAAClimbingGrades.allCases.map{ $0.rawValue }
        case YDSClimbingGrades.systemName:
            return YDSClimbingGrades.allCases.map{ $0.rawValue }
        default:
            fatalError("Unknown system name \(systemName)")
        }
    }
}
