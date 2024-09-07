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
    
    @State private var isAddingClimb = false
    @State var text = ""
    @State var tick = Tick()
    
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
                    AddTickButtonView(action: { isAddingClimb = true})
                        .background(Color.white)
                }
            }
        }
        .navigationTitle("Ticklist")
        .sheet(isPresented: $isAddingClimb, onDismiss: resetTick) {
            AddClimbView(tick: $tick, onButtonTap: createTick)
                .presentationDragIndicator(.visible)
        }
    }
    
    private func createTick() {
        isAddingClimb = false
        modelContext.insert(tick)
        tick = Tick()
    }

    private func deleteTick(offsets: IndexSet) -> Void {
        withAnimation {
            for index in offsets {
                modelContext.delete(ticks[index])
            }
        }
    }
    
    private func resetTick() {
        tick = Tick()
    }
}

#Preview {
    OverView()
        .modelContainer(for: Tick.self, inMemory: true)
}
