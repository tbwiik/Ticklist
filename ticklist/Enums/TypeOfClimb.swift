//
//  TypeOfClimb.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 28/09/2024.
//

import Foundation

enum TypeOfClimb: String, Codable, CaseIterable, Identifiable {
    case boltedSinglepitch
    case boltedMultipitch
    case tradSinglepitch
    case tradMultipitch
    case notSet
    
    var id: Self { self }
    
    static var defaultValue: TypeOfClimb { .boltedSinglepitch }
    
    var shortDescription: String {
        switch self {
        case .boltedSinglepitch:
            "Sport"
        case .boltedMultipitch:
            "Multipitch"
        case .tradSinglepitch:
            "Trad Single"
        case .tradMultipitch:
            "Trad"
        case .notSet:
            "Not Set"
        }

    }
    
    var description: String {
        switch self {
        case .boltedSinglepitch:
            "Bolted Singlepitch"
        case .boltedMultipitch:
            "Bolted Multipitch"
        case .tradSinglepitch:
            "Trad Singlepitch"
        case .tradMultipitch:
            "Trad Multipitch"
        case .notSet:
            "Type of Climb is not set"
        }
    }
    
    /// All cases except .notSet
    static var allCases: [TypeOfClimb] { [.boltedSinglepitch, .boltedMultipitch, .tradSinglepitch, .tradMultipitch] }
}
