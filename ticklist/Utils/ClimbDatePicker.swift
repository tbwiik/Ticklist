//
//  ClimbDatePicker.swift
//  ticklist
//
//  Created by Torbjørn Wiik on 25/09/2024.
//

import SwiftUI

struct ClimbDatePicker: View {
    
    @Binding var date: Date
    
    init(_ date: Binding<Date>) {
        self._date = date
    }
    
    var body: some View {
        DatePicker("Time of Climb", selection: $date, displayedComponents: .date)
            .datePickerStyle(.compact)
    }
}

#Preview {
    ClimbDatePicker(.constant(.now))
}
