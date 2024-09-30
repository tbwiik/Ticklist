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
        }
    }
}
