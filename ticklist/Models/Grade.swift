//
//  Grade.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 13/09/2024.
//

import Foundation
import SwiftData

// TODO: really not happy with this solution
// It is unsafe and very unelegant, but I have spend countless hours trying to come up with a good solution
// Something I haven't accomplished while still being able to use grade and systems as I want to

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
    
    func defaultValueFromSystem() -> String {
        switch systemName {
        case FrenchClimbingGrades.systemName:
            return FrenchClimbingGrades.defaultValue
        case NorwegianClimbingGrades.systemName:
            return NorwegianClimbingGrades.defaultValue
        case UIAAClimbingGrades.systemName:
            return UIAAClimbingGrades.defaultValue
        case YDSClimbingGrades.systemName:
            return YDSClimbingGrades.defaultValue
        default:
            fatalError("Unknown system name \(systemName)")
        }
    }
    
    static let allSystems = [FrenchClimbingGrades.systemName, NorwegianClimbingGrades.systemName, UIAAClimbingGrades.systemName, YDSClimbingGrades.systemName]
}
