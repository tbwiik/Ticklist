//
//  OverView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI
import SwiftData

struct OverView: View {
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var ticks: [Tick]
    
    @State private var isAddingClimb = false
    @State var searchText: String = ""
    @State var newTick = Tick()
    
    private enum Constants {
        static let searchbarPrompt = "Name of climb"
    }
    
    // MARK: - Computed Properties
    private var filteredTicks: [Tick] {
        guard !searchText.isEmpty else { return ticks }
        return ticks.filter { $0.climbName.lowercased().contains(searchText.lowercased()) }
    }
    
    // MARK: - View Body
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
            AddClimbView(tick: newTick,
                         onButtonTap: createTick)
                .presentationDragIndicator(.visible)
                .presentationDetents(.init([.medium, .large]))
                .presentationContentInteraction(.resizes)
        }
    }
    
    //MARK: - Helper Methods
    private func createTick() {
        isAddingClimb = false
        modelContext.insert(newTick)
        resetTick()
    }

    private func deleteTick(offsets: IndexSet) -> Void {
        withAnimation {
            for index in offsets {modelContext.delete(ticks[index])}
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
