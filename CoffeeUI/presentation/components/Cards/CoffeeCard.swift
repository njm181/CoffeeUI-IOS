//
//  CoffeeCard.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import SwiftUI

struct CoffeeCard: View {
    @EnvironmentObject var menuViewModel: MenuViewModel
    var mainMenu: MainMenu
    @State private var itemCounter: Int = 0
    
    var body: some View {
        VStack {
            if mainMenu.image != "not_coffee" {
                AsyncImage(url: URL(string: mainMenu.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Image(systemName: "icloud.slash")
                            .resizable()
                            .frame(width: 100, height: 100)
                    } else {
                            ProgressView()
                    }
                }
                .frame(width: 100, height: 100)
            } else {
                Image(systemName: "nosign")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            
            Text(mainMenu.title)
                .font(.custom(.bold, size: 18))
            
            if mainMenu.image != "not_coffee" {
                Text("$\(mainMenu.price)")
                    .font(.headline)
                
                HStack {
                    Button(
                        action: {
                            itemCounter+=1
                            menuViewModel.setItemToList(mainMenu: mainMenu)
                        },
                        label: {
                            Image(systemName: "plus")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                                .clipShape(Circle())
                                .shadow(radius: 2, x: 0, y: 2)
                                .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.black, lineWidth: 2))
                        })
                    
                    if itemCounter > 0 {
                        Text(String(itemCounter)).font(.system(size: 16))
                        
                        Button(
                            action: {
                                itemCounter-=1
                                menuViewModel.removeItemFromList(mainMenu: mainMenu)
                            },
                            label: {
                                Image(systemName: "minus")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                    .clipShape(Circle())
                                    .shadow(radius: 2, x: 0, y: 2)
                                    .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.black, lineWidth: 2))
                            })
                    }
                    
                    
                }.padding()
            }
                
            
            
        }
        .frame(width: 150)
        .padding()
        .onAppear {
            itemCounter = menuViewModel.getAmountSelected(mainMenu: mainMenu)
                    }
    }
}

#Preview {
    CoffeeCard(mainMenu: Coffee(
        image: "https://static.vecteezy.com/system/resources/previews/022/092/292/non_2x/mocha-coffee-frappe-in-glass-free-png.png",
        imageBackground: "#8b6969", title: "Latte Macchiato", price: "3.90", code: "111", amount: 0)
    )
}
