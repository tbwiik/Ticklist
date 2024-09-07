//
//  ClimbingGrades.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 07/09/2024.
//

import Foundation

/// Enum for French Climbing Climbing Grades
enum FrenchClimbingGrades: String, CaseIterable, Identifiable {
    
    var id: Self { self }
    
    case grade1 = "1"
    case grade2 = "2"
    case grade3 = "3"
    case grade4 = "4"
    case grade4a = "4a"
    case grade4b = "4b"
    case grade4c = "4c"
    case grade5 = "5"
    case grade5a = "5a"
    case grade5b = "5b"
    case grade5c = "5c"
    case grade6a = "6a"
    case grade6aPlus = "6a+"
    case grade6b = "6b"
    case grade6bPlus = "6b+"
    case grade6c = "6c"
    case grade6cPlus = "6c+"
    case grade7a = "7a"
    case grade7aPlus = "7a+"
    case grade7b = "7b"
    case grade7bPlus = "7b+"
    case grade7c = "7c"
    case grade7cPlus = "7c+"
    case grade8a = "8a"
    case grade8aPlus = "8a+"
    case grade8b = "8b"
    case grade8bPlus = "8b+"
    case grade8c = "8c"
    case grade8cPlus = "8c+"
    case grade9a = "9a"
    case grade9aPlus = "9a+"
    case grade9b = "9b"
    case grade9bPlus = "9b+"
    case grade9c = "9c"
}
