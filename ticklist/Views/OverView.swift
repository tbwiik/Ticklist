//
//  OverView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI
import SwiftData

struct OverView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var ticks: [Tick]
    
    private let searchbarPrompt = "Silence"
    
    @State var text = ""
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack{
                    List {
                        ForEach(ticks) { tick in
                            NavigationLink{
                                Text ("Placeholder") //TODO: update
                            } label: {
                                TickCardView(tick)
                            }
                        }
                        .onDelete(perform: deleteTick)
                    }
                    .searchable(text: $text, prompt: searchbarPrompt)
                }
                VStack {
                    Spacer()
                    AddTickButtonView(action: addTick)
                        .background(Color.white)
                }
            }
        }
        .navigationTitle("Ticklist")
    }
    
    
    private func addTick() -> Void {
        withAnimation{
            modelContext.insert(Tick.mock)
        }
    }

    private func deleteTick(offsets: IndexSet) -> Void {
        withAnimation {
            for index in offsets {
                modelContext.delete(ticks[index])
            }
        }
    }
}

#Preview {
    OverView()
        .modelContainer(for: Tick.self, inMemory: true)
}
