//
//  TickMockData.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import Foundation

extension Tick {
    
    static let mock: Tick = .init(climbName: "Silence", cragName: "Hanshelleren", dateClimbed: .now, grade: "9c", comment: "Hardest climb ever")
}
