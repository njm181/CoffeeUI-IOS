//
//  carousel.swift
//  CoffeeUI
//
//  Created by Nico Molina on 28/11/2023.
//

import Foundation
import SwiftUI

struct CoffeeCarouselView: View {
    let coffeesList: [Coffee]
    @Binding var coffeeBackgroundColor: String
    
    @State private var currentIndex = 0
    
//    init(coffeesList: [Coffee] = [], coffeeBackgroundColor: String = "", currentIndex: Int = 0) {
//        self.coffeesList = coffeesList
//        self.coffeeBackgroundColor = coffeeBackgroundColor
//        self.currentIndex = currentIndex
//        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
//    }
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(coffeesList.indices, id: \.self) { index in
                CoffeeCard(mainMenu: coffeesList[index])
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .onChange(of: currentIndex) { oldIndex, newIndex in
            handleImageSelection(index: newIndex, oldIndex: oldIndex)
        }
        .onAppear(){
            UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        }
    }

    func handleImageSelection(index: Int, oldIndex: Int) {
        let selectedImage = coffeesList[index]
        print("OLD -> \(oldIndex)")
        print("CURRENT -> \(index)")
        print("Image selected: \(selectedImage.title), Description: \(selectedImage.image)")
        coffeeBackgroundColor = coffeesList[index].imageBackground
    }
}

//struct ImageData: Identifiable {
//    var id = UUID()
//    var imageName: String
//    var description: String
//}

struct CoffeeCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let coffeesList = [
            Coffee(image: "https://static.vecteezy.com/system/resources/previews/022/092/292/non_2x/mocha-coffee-frappe-in-glass-free-png.png",
                   imageBackground: "#8b6969", title: "Latte Macchiato", price: "3.90", code: "111", amount: 0),
            Coffee(image: "https://static.vecteezy.com/system/resources/previews/011/048/028/non_2x/iced-coffee-watercolor-set-free-png.png",
                   imageBackground: "#664228", title: "Flat White", price: "3.60", code: "112", amount: 0),
        ]
        CoffeeCarouselView(coffeesList: coffeesList, coffeeBackgroundColor: .constant(""))
    }
}
