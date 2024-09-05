//
//  TickMockData.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import Foundation

extension Tick {
    
    static let mockSilence: Tick = .init(climbName: "Silence", cragName: "Hanshelleren", dateClimbed: .now, grade: "9c", comment: "Hardest climb ever")
    static let mockActionDirecte: Tick = .init(climbName: "Action Directe", cragName: "Waldkopf", dateClimbed: .now, grade: "9a", comment: "First climb with consensus 9a")
    static let mockErebor: Tick = .init(climbName: "Erebor", cragName: "Eremo di San Paolo", dateClimbed: .now, grade: "9b/9b+", comment: "Hardest female ascent by Laura Rogora")
    
    static let mockTicks: [Tick] = [mockSilence, mockActionDirecte, mockErebor]
}
