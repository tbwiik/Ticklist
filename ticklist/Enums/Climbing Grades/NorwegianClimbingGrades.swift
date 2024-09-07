//
//  NorwegianClimbingGrades.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 07/09/2024.
//

import Foundation

/// Enum for Norwegian Climbing Grades
enum NorwegianClimbingGrades: String, CaseIterable, Identifiable {
    
    var id: Self { self }
    
    case grade3 = "3"
    case grade4 = "4"
    case grade5 = "5"
    case grade6Minus = "6-"
    case grade6 = "6"
    case grade6Plus = "6+"
    case grade7Minus = "7-"
    case grade7 = "7"
    case grade7Plus = "7+"
    case grade8Minus = "8-"
    case grade8 = "8"
    case grade8Plus = "8+"
    case grade9Minus = "9-"
    case grade9 = "9"
    case grade9Plus = "9+"
}

extension NorwegianClimbingGrades {
    func toFrench() -> FrenchClimbingGrades? {
        switch self {
        case .grade3: return .grade1
        case .grade4: return .grade2
        case .grade5: return .grade3
        case .grade6Minus: return .grade4b
        case .grade6: return .grade5
        case .grade6Plus: return .grade5b
        case .grade7Minus: return .grade6a
        case .grade7: return .grade6b
        case .grade7Plus: return .grade6c
        case .grade8Minus: return .grade7a
        case .grade8: return .grade7b
        case .grade8Plus: return .grade7c
        case .grade9Minus: return .grade8a
        case .grade9: return .grade8b
        case .grade9Plus: return .grade8c
        }
    }
}
