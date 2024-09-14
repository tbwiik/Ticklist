//
//  GradingSystem.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 14/09/2024.
//

import Foundation

protocol GradingSystem: Identifiable, Codable, CaseIterable {
    var id: Self { get }
    var string: String { get }
    static var defaultValue: Self { get }
    
    func toFrench() -> FrenchClimbingGrades?
}
