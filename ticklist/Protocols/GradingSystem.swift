//
//  GradingSystem.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 14/09/2024.
//

import Foundation

protocol GradingSystem: Codable, Hashable, CaseIterable, Identifiable {
    static var defaultValue: Self { get }
    static var systemName: String { get }
    
    func toFrench() -> FrenchClimbingGrades?
    
    var string: String { get }
}

// To expose static property
extension GradingSystem {
    var systemName: String { Self.systemName }
}
