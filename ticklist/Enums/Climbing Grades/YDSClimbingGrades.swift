//
//  YdsClimbingGrades.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 07/09/2024.
//

import Foundation

/// Enum for YDS (American) Climbing Grades
enum YDSClimbingGrades: String, GradingSystem {
    var id: UUID { UUID() }
    static let defaultValue = Self.grade5_11c
    static let systemName: String = "YDS"
    
    var string: String { self.rawValue }
    
    case grade5_0 = "5.0"
    case grade5_1 = "5.1"
    case grade5_2 = "5.2"
    case grade5_3 = "5.3"
    case grade5_4 = "5.4"
    case grade5_5 = "5.5"
    case grade5_6 = "5.6"
    case grade5_7 = "5.7"
    case grade5_8 = "5.8"
    case grade5_9 = "5.9"
    case grade5_10a = "5.10a"
    case grade5_10b = "5.10b"
    case grade5_10c = "5.10c"
    case grade5_10d = "5.10d"
    case grade5_11a = "5.11a"
    case grade5_11b = "5.11b"
    case grade5_11c = "5.11c"
    case grade5_11d = "5.11d"
    case grade5_12a = "5.12a"
    case grade5_12b = "5.12b"
    case grade5_12c = "5.12c"
    case grade5_12d = "5.12d"
    case grade5_13a = "5.13a"
    case grade5_13b = "5.13b"
    case grade5_13c = "5.13c"
    case grade5_13d = "5.13d"
    case grade5_14a = "5.14a"
    case grade5_14b = "5.14b"
    case grade5_14c = "5.14c"
    case grade5_14d = "5.14d"
    case grade5_15a = "5.15a"
    case grade5_15b = "5.15b"
    case grade5_15c = "5.15c"
    case grade5_15d = "5.15d"
}

extension YDSClimbingGrades {
    func toFrench() -> FrenchClimbingGrades? {
        switch self {
        case .grade5_0: return .grade1
        case .grade5_1: return .grade2
        case .grade5_2: return .grade3
        case .grade5_3: return .grade4
        case .grade5_4: return .grade4a
        case .grade5_5: return .grade4b
        case .grade5_6: return .grade4c
        case .grade5_7: return .grade5
        case .grade5_8: return .grade5a
        case .grade5_9: return .grade5b
        case .grade5_10a: return .grade5c
        case .grade5_10b: return .grade6a
        case .grade5_10c: return .grade6aPlus
        case .grade5_10d: return .grade6b
        case .grade5_11a: return .grade6bPlus
        case .grade5_11b: return .grade6c
        case .grade5_11c: return .grade6cPlus
        case .grade5_11d: return .grade7a
        case .grade5_12a: return .grade7aPlus
        case .grade5_12b: return .grade7b
        case .grade5_12c: return .grade7bPlus
        case .grade5_12d: return .grade7c
        case .grade5_13a: return .grade7cPlus
        case .grade5_13b: return .grade8a
        case .grade5_13c: return .grade8aPlus
        case .grade5_13d: return .grade8b
        case .grade5_14a: return .grade8bPlus
        case .grade5_14b: return .grade8c
        case .grade5_14c: return .grade8cPlus
        case .grade5_14d: return .grade9a
        case .grade5_15a: return .grade9aPlus
        case .grade5_15b: return .grade9b
        case .grade5_15c: return .grade9bPlus
        case .grade5_15d: return .grade9c
        }
    }
}
