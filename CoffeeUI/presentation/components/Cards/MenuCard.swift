//
//  MenuCard.swift
//  CoffeeUI
//
//  Created by Nico Molina on 27/11/2023.
//

import Foundation
import SwiftUI



struct MenuCardView: View {
    @EnvironmentObject var menuViewModel: MenuViewModel
    var mainMenu: MainMenu
    @State private var itemCounter: Int = 0
    var showBill: Bool = false


    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: URL(string: mainMenu.image)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: showBill ? 20 : 40, height: showBill ? 20 : 40)
            }
            .frame(maxWidth: showBill ? 35 : 70, maxHeight: .infinity, alignment: .center)
            .background(Color.init(hex: mainMenu.imageBackground))
            .cornerRadius(showBill ? 5 : 10)
            
            
            VStack {
                Text(mainMenu.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: showBill ? 12 : 16))
                Text("$\(mainMenu.price)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: showBill ? 12 : 16))
            }
            .frame(maxWidth: .infinity)
            
            if showBill {
                VStack {
                    Text("x\(String(mainMenu.amount))").font(.system(size: 12))
                }
                .frame(width: 30, height: 25)
                .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.black, lineWidth: 1))
            } else {
                HStack {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(2)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.black, lineWidth: 2))
                        .onTapGesture {
                            itemCounter+=1
                            menuViewModel.setItemToList(mainMenu: mainMenu)
                            print("ADD")
                        }
                    
                    if itemCounter > 0 {
                        Text(String(itemCounter)).font(.system(size: 16))
                        
                        Image(systemName: "minus")
                            .resizable()
                            .padding(2)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.black, lineWidth: 2))
                            .onTapGesture {
                                itemCounter-=1
                                menuViewModel.removeItemFromList(mainMenu: mainMenu)
                                print("SUBTRACT")
                            }
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
        .background(.white)
        .cornerRadius(showBill ? 5 : 10)
        .shadow(radius: showBill ? 2 : 6)
        .padding(.trailing, showBill ? 4 : 0)
        .onAppear {
            itemCounter = menuViewModel.getAmountSelected(mainMenu: mainMenu)
                    }
    }
    
}

struct MenuCardView_Previews:
    PreviewProvider {
    static var previews: some View {
        MenuCardView(mainMenu: Drink(image: "https://static.vecteezy.com/system/resources/previews/011/288/551/non_2x/glass-with-a-cocktail-free-png.png", imageBackground: "#63c6d4", title: "Drink Test", price: "10.95", code: "100", amount: 0))
    }
}

