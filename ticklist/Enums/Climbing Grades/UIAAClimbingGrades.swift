//
//  UIAAClimbingGrades.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 07/09/2024.
//

import Foundation

/// Enum for UIAA Climbing Grades
enum UIAAClimbingGrades: String, CaseIterable, Identifiable, Codable {
    
    var id: Self { self }
    
    case gradeI = "I"
    case gradeII = "II"
    case gradeIII = "III"
    case gradeIV = "IV"
    case gradeIVPlus = "IV+"
    case gradeV = "V"
    case gradeVPlus = "V+"
    case gradeVIMinus = "VI-"
    case gradeVI = "VI"
    case gradeVIPlus = "VI+"
    case gradeVII = "VII"
    case gradeVIIPlus = "VII+"
    case gradeVIII = "VIII"
    case gradeVIIIPlus = "VIII+"
    case gradeIX = "IX"
    case gradeIXPlus = "IX+"
    case gradeX = "X"
    case gradeXPlus = "X+"
    case gradeXI = "XI"
    case gradeXIPlus = "XI+"
    case gradeXII = "XII"
    case gradeXIIPlus = "XII+"
}

extension UIAAClimbingGrades {
    func toFrench() -> FrenchClimbingGrades? {
        switch self {
        case .gradeI: return .grade1
        case .gradeII: return .grade2
        case .gradeIII: return .grade3
        case .gradeIV: return .grade4
        case .gradeIVPlus: return .grade4b
        case .gradeV: return .grade4c
        case .gradeVPlus: return .grade5
        case .gradeVIMinus: return .grade5a
        case .gradeVI: return .grade5b
        case .gradeVIPlus: return .grade5c
        case .gradeVII: return .grade6a
        case .gradeVIIPlus: return .grade6aPlus
        case .gradeVIII: return .grade6b
        case .gradeVIIIPlus: return .grade6bPlus
        case .gradeIX: return .grade6c
        case .gradeIXPlus: return .grade6cPlus
        case .gradeX: return .grade7a
        case .gradeXPlus: return .grade7aPlus
        case .gradeXI: return .grade7b
        case .gradeXIPlus: return .grade7bPlus
        case .gradeXII: return .grade7c
        case .gradeXIIPlus: return .grade8a
        }
    }
}
