//
//  ClimbDatePicker.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 25/09/2024.
//

import SwiftUI

struct ClimbDatePicker: View {
    //MARK: - Properties
    @Binding var date: Date
    
    //MARK: - Initializers
    init(_ date: Binding<Date>) {
        self._date = date
    }
    
    //MARK: - View Body
    var body: some View {
        DatePicker("Time of Climb", selection: $date, displayedComponents: .date)
            .datePickerStyle(.compact)
    }
}

#Preview {
    ClimbDatePicker(.constant(.now))
}
