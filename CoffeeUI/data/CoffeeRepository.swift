//
//  CoffeeRepository.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import Foundation

protocol ProtocolCoffeeRepository {
    func getAllOrdersHistory() -> [OrderHistory]
    func insertOrderHistory()
}
