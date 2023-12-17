//
//  ContentView.swift
//  CoffeeUI
//
//  Created by Nico Molina on 27/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          //initial screen
            DashboardView()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [OrderHistory.self], inMemory: true)
}
