//
//  TickMockData.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import Foundation

extension Tick {
    
    static let mockSilence: Tick = .init(climbName: "Silence", cragName: "Hanshelleren", timeOfClimb: .now, grade: FrenchClimbingGrades.grade9c, comment: "Hardest climb ever")
    static let mockActionDirecte: Tick = .init(climbName: "Action Directe", cragName: "Waldkopf", timeOfClimb: .now, grade: FrenchClimbingGrades.grade9a, comment: "First climb with consensus 9a")
    static let mockErebor: Tick = .init(climbName: "Erebor", cragName: "Eremo di San Paolo", timeOfClimb: .now, grade: FrenchClimbingGrades.grade9b, comment: "Hardest female ascent by Laura Rogora")
    
    static let mockTicks: [Tick] = [mockSilence, mockActionDirecte, mockErebor]
}
