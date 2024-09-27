//
//  OverView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI
import SwiftData

struct OverView: View {
    
    private enum Constants {
        static let searchbarPrompt = "Silence"
    }
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var isAddingClimb = false
    @State var searchText: String = ""
    @State var newTick = Tick()
    
    @Query private var ticks: [Tick]

    private var filteredTicks: [Tick] {
        guard !searchText.isEmpty else { return ticks }
        return ticks.filter { $0.climbName.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack{
                    List {
                        ForEach(filteredTicks) { tick in
                            NavigationLink{
                                DetailView(tick: tick)
                            } label: {
                                TickCardView(tick)
                            }
                        }
                        .onDelete(perform: deleteTick)
                    }
                    .searchable(text: $searchText, prompt: Constants.searchbarPrompt)
                }
                OverviewAddButton(isAddingClimb: $isAddingClimb)
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
        .preferredColorScheme(.light)
}
