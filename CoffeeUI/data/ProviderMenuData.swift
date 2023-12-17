//
//  ProviderMenuData.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import Foundation

struct ProviderMenuData {
    let coffeeList = [
        Coffee(image: "https://static.vecteezy.com/system/resources/previews/022/092/292/non_2x/mocha-coffee-frappe-in-glass-free-png.png",
               imageBackground: "#8b6969", title: "Latte Macchiato", price: "3.90", code: "111", amount: 0),
        Coffee(image: "https://static.vecteezy.com/system/resources/previews/011/048/028/non_2x/iced-coffee-watercolor-set-free-png.png",
               imageBackground: "#664228", title: "Flat White", price: "3.60", code: "112", amount: 0),
        Coffee(image: "https://static.vecteezy.com/system/resources/previews/011/048/025/non_2x/iced-coffee-watercolor-set-free-png.png",
               imageBackground: "#59260b", title: "Expresso Macchiato", price: "4.10", code: "113", amount: 0),
        Coffee(image: "https://static.vecteezy.com/system/resources/previews/011/048/029/non_2x/iced-coffee-watercolor-set-free-png.png",
               imageBackground: "#480607", title: "Cappuccino", price: "5.30", code: "", amount: 0),
        Coffee(image: "not_coffee", imageBackground: "#FFFFFF", title: "No Coffee", price: "", code: "000", amount: 0)
    ]
    
    let drinkList = [
        Drink(image: "https://static.vecteezy.com/system/resources/previews/011/288/551/non_2x/glass-with-a-cocktail-free-png.png",
              imageBackground: "#63c6d4", title: "Blue Lagoon", price: "3.90", code: "001", amount: 0),
        Drink(image: "https://static.vecteezy.com/system/resources/previews/025/064/825/non_2x/cola-with-ai-generated-free-png.png",
              imageBackground: "#794044", title: "Long Island", price: "4.10", code: "002", amount: 0),
        Drink(image: "https://static.vecteezy.com/system/resources/previews/020/003/854/non_2x/watermelon-mojito-mocktail-graphic-clipart-design-free-png.png",
              imageBackground: "#cc237b", title: "Cosmopolitan", price: "3.60", code: "003", amount: 0),
        Drink(image: "https://static.vecteezy.com/system/resources/previews/033/504/212/non_2x/soft-drinks-with-ai-generated-free-png.png",
              imageBackground: "#ffd700", title: "Negroni", price: "5.30", code: "004", amount: 0),
    ]
    
    let donutList = [
        Donut(image: "https://static.vecteezy.com/system/resources/previews/022/962/933/non_2x/strawberry-donuts-3d-sweets-icon-png.png",
              imageBackground: "#ff80ed", title: "Strawberry", price: "3.90", code: "005", amount: 0),
        Donut(image: "https://static.vecteezy.com/system/resources/previews/016/774/433/non_2x/colourful-decorated-donuts-isolated-on-transparent-background-free-png.png",
              imageBackground: "#468499", title: "Vegan Blue", price: "4.15", code: "006", amount: 0),
        Donut(image: "https://static.vecteezy.com/system/resources/previews/016/774/619/non_2x/colourful-decorated-donuts-isolated-on-transparent-background-free-png.png",
              imageBackground: "#794044", title: "Choco Marble", price: "3.60", code: "007", amount: 0),
        Donut(image: "https://static.vecteezy.com/system/resources/previews/016/774/534/non_2x/colourful-decorated-donuts-isolated-on-transparent-background-free-png.png",
              imageBackground: "#2acaea", title: "Blue Sky", price: "2.90", code: "008", amount: 0),
        Donut(image: "https://static.vecteezy.com/system/resources/previews/016/774/434/non_2x/colourful-decorated-donuts-isolated-on-transparent-background-free-png.png",
              imageBackground: "#f5f5f5", title: "Sugar Raised", price: "4.00", code: "009", amount: 0),
    ]
}

