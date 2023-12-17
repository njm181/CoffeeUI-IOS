//
//  DatabaseContainer.swift
//  CoffeeUI
//
//  Created by Nico Molina on 13/12/2023.
//

import Foundation
import SwiftData

class DatabaseContainer {
    let container: ModelContainer

        init() {
            let schema = Schema([OrderHistory.self])
            //let schema = Schema([OrderHistory.self, MainMenu.self])
            //let schema = Schema()
            //let schema = Schema([MainMenu.self, OrderHistory.self])

            let config = ModelConfiguration("CoffeeUI", schema: schema, isStoredInMemoryOnly: false, allowsSave: true)

            do {
                container = try ModelContainer(for: schema, configurations: config)
            } catch {
                fatalError("Failed to initialize ModelContainer")
            }
        }
}
