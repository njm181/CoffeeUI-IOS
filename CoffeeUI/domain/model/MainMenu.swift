//
//  MainMenu.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import Foundation
import SwiftData

class MainMenu {
    var image: String = ""
    var imageBackground: String = ""
    var title: String = ""
    var price: String = ""
    var code: String = ""
    var amount: Int = 0
    
    init(title: String, amount: Int){
        self.title = title
        self.amount = amount
    }
    
    init(image: String, imageBackground: String, title: String, price: String, code: String, amount: Int) {
        self.image = image
        self.imageBackground = imageBackground
        self.title = title
        self.price = price
        self.code = code
        self.amount = amount
    }
}
