//
//  OrderHistory.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class OrderHistory {
    @Attribute(.unique)
    var id: String = UUID().uuidString
    var historyOrders: [String:String] = [:]
    
    init(){}
}
