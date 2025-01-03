//
//  GradingSystem.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 14/09/2024.
//

import Foundation

protocol GradingSystem: Codable, CaseIterable {
    static var defaultValue: String { get }
    static var systemName: String { get }
    
    func toFrench() -> FrenchClimbingGrades?
}
