//
//  TickCardView.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 05/09/2024.
//

import SwiftUI

struct TickCardView: View {
    //MARK: - Properties
    private let tickImage = "mountain.2"
    
    let tick: Tick
    
    //MARK: - Initializers
    init(_ tick: Tick) {
        self.tick = tick
    }
    
    //MARK: - View Body
    var body: some View {
        HStack{
            Label(tick.grade.string, systemImage: tickImage)
                .font(.title2) // TODO: update
            VStack (alignment: .leading) {
                Text(tick.climbName)
                    .font(.headline) // TODO: update
                Text(tick.cragName)
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var mock = Tick(climbName: "Silence", cragName: "Hanshelleren", timeOfClimb: .now, grade: Grade(FrenchClimbingGrades.grade9c), comment: "Hardest climb ever")
    TickCardView(mock)
}
