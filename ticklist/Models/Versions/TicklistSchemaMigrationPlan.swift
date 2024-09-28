//
//  SchemaMigrationPlan.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 28/09/2024.
//

import Foundation
@preconcurrency import SwiftData

enum TicklistSchemaMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [TicklistSchemaV1.self, TicklistSchemaV2.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }
    
    static let migrateV1toV2 = MigrationStage.custom(
        fromVersion: TicklistSchemaV1.self,
        toVersion: TicklistSchemaV2.self,
        willMigrate: nil,
        didMigrate: { context in
            let ticks = try? context.fetch(FetchDescriptor<TicklistSchemaV2.Tick>())
            guard let ticks else { return }
            
            for tick in ticks {
                tick.typeOfClimb = .notSet
            }
            
            try context.save()
        }
    )
}
