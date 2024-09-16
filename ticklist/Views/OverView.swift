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
    @State var newTick = Tick()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack{
                    List {
                        ForEach(ticks) { tick in
                            NavigationLink{
                                DetailView(tick: tick)
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
            AddClimbView(tick: $newTick, onButtonTap: createTick)
                .presentationDragIndicator(.visible)
                .presentationDetents(.init([.medium, .large]))
                .presentationContentInteraction(.resizes)
        }
    }
    
    private func createTick() {
        isAddingClimb = false
        modelContext.insert(newTick)
        resetTick()
    }

    private func deleteTick(offsets: IndexSet) -> Void {
        withAnimation {
            for index in offsets {
                modelContext.delete(ticks[index])
            }
        }
    }
    
    private func resetTick() {
        newTick = Tick()
    }
}

#Preview {
    OverView()
        .modelContainer(for: Tick.self, inMemory: true)
}
