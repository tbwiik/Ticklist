//
//  Grade.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 13/09/2024.
//

import Foundation
import SwiftData

@Model
class Grade: Identifiable, Hashable, Equatable {
    
    // MARK: - Variables
    var id: UUID
    var value: any GradeProtocol
    var systm: any GradeProtocol {
        get {
            return value.self
        }
        set(newVal) {
            self.value = newVal
        }
    }
    
    // MARK: - Initializers
    init(_ value: any GradeProtocol) {
        self.id = UUID()
        self.value = value
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        
        let decodeGradeSystem = try container.decode(GradeSystems.self, forKey: .systm)
        
        switch decodeGradeSystem {
        case .french:
            self.value = try container.decode(FrenchClimbingGrades.self, forKey: .value)
        case .norwegian:
            self.value = try container.decode(NorwegianClimbingGrades.self, forKey: .value)
        case .uiaa:
            self.value = try container.decode(UIAAClimbingGrades.self, forKey: .value)
        case .yds:
            self.value = try container.decode(YDSClimbingGrades.self, forKey: .value)
        default:
            throw DecodingError.dataCorruptedError(forKey: .systm, in: container, debugDescription: "Unknown grade system")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(value, forKey: .value)
    }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        case id, value, type, systm
    }
    
    // MARK: - Protocol conformance functions
    static func == (lhs: Grade, rhs: Grade) -> Bool {
        let sameValue = lhs.value.toFrench() == rhs.value.toFrench()
        let sameSystm = lhs.systm.type == rhs.systm.type
        return sameValue && sameSystm
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value.toFrench())
    }
    
}
