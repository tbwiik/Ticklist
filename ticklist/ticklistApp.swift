//
//  ticklistApp.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI
import SwiftData

@main
struct ticklistApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Tick.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            OverView()
        }
        .modelContainer(sharedModelContainer)
    }
}
