//
//  MenuViewModel.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import Foundation
import SwiftData
import Combine

final class MenuViewModel: ObservableObject {
    
    private let databaseContainer: DatabaseContainer
    @Published var donutsList: [Donut] = []
    @Published var drinksList: [Drink] = []
    @Published var coffeesList: [Coffee] = []
    
    private var subscription: AnyCancellable?
    @Published var orders: [OrderHistory] = []
    
    @Published var drinkSelectedState = 0
    @Published var donutSelectedState = 0
    
    @Published var providerMenuData = ProviderMenuData()

        init() {
            self.databaseContainer = DatabaseContainer()
        }
    
    
    func getAmountSelected(mainMenu: MainMenu) -> Int {
        switch mainMenu {
        case let donut as Donut:
            donutSelectedState = donutsList.filter { $0.code == mainMenu.code }.count
            return donutSelectedState
            
        case let coffee as Coffee:
            return coffeesList.filter { $0.code == mainMenu.code }.count
            
        case let drink as Drink:
            drinkSelectedState = drinksList.filter { $0.code == mainMenu.code }.count
            return drinkSelectedState
            
        default:
            return 0
        }
    }
    
    func setItemToList(mainMenu: MainMenu) {
        switch mainMenu {
            
        case let donut as Donut:
            donutsList.append(donut)
            
        case let coffee as Coffee:
            coffeesList.append(coffee)
            
            
        case let drink as Drink:
            drinksList.append(drink)
            
        default:
            print("=====DEFAULT=====")
        }
        
    }
    
    func removeItemFromList(mainMenu: MainMenu) {
        switch mainMenu {
            
        case let donut as Donut:
            if let indexToRemove = donutsList.firstIndex(where: { $0.code == donut.code }){
                donutsList.remove(at: indexToRemove)
            } else {
                print("DONUT NOT FOUND")
            }
            
        case let coffee as Coffee:
            if let indexToRemove = coffeesList.firstIndex(where: { $0.code == coffee.code }){
                coffeesList.remove(at: indexToRemove)
            } else {
                print("COFFEE NOT FOUND")
            }
            
        case let drink as Drink:
            if let indexToRemove = drinksList.firstIndex(where: { $0.code == drink.code }){
                drinksList.remove(at: indexToRemove)
                
            } else {
                print("DRINK NOT FOUND")
            }
            
        default:
            print("=====DEFAULT=====")
        }
        
    }
    
    func getShoppingList() -> [MainMenu] {
        var repetitionCount: [String:Int] = [:]
        let purchaseItemsList = drinksList + donutsList + coffeesList
        
        for item in purchaseItemsList {
            repetitionCount[item.code, default: 0]+=1
        }
        
        let uniqueList = purchaseItemsList.filter { item in
            guard let repetitions = repetitionCount[item.code] else {
                return false
            }

            repetitionCount[item.code] = nil
            item.amount = repetitions
            return true
        }
        return uniqueList
    }
    
    func getTotalPurchase() -> String {
        var totalPurchase = 0.00
        let purchaseItemList = drinksList + donutsList + coffeesList
        purchaseItemList.forEach { item in
            totalPurchase += Double(item.price) ?? 0.00
        }
        
        let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2

        if let formattedTotal = formatter.string(from: NSNumber(value: totalPurchase)) {
            return formattedTotal
        } else {
            return "Error formatting total"
        }
    }
    
    @MainActor
    func savePurchaseOrder(){
        let orderHistory: OrderHistory = OrderHistory()
        let shoppingList = getShoppingList()
        shoppingList.forEach{ item in
            orderHistory.historyOrders[item.title] = String(item.amount)
        }
        
        modelContext.insert(orderHistory)
        
    }
    
    @MainActor
    var modelContext: ModelContext {
        databaseContainer.container.mainContext
    }
    
    func getDatabaseContainer() -> ModelContainer {
        return databaseContainer.container
    }
    
    @MainActor
    func getOrderHistories() {
        let fetchDescriptor = FetchDescriptor<OrderHistory>(predicate: nil, sortBy: [SortDescriptor<OrderHistory>(\.id)])
        orders = try! modelContext.fetch(fetchDescriptor)
    }
}
