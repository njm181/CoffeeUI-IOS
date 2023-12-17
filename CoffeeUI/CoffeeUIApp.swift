//
//  CoffeeUIApp.swift
//  CoffeeUI
//
//  Created by Nico Molina on 27/11/2023.
//

import SwiftUI
import SwiftData

@main
struct CoffeeUIApp: App {

    let menuViewModel = MenuViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuViewModel)
        }
        .modelContainer(menuViewModel.getDatabaseContainer())
    }
    
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [OrderHistory.self], inMemory: true)
}
