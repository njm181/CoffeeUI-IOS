//
//  PurchaseBottomSheet.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import SwiftUI

struct PurchaseBottomSheetView: View {
    @EnvironmentObject var menuViewModel: MenuViewModel
    @Binding var showPurchaseSheet: Bool
    @Binding var coffeeBackgroundColor: String
    
    
    var body: some View {
        VStack {
            
        }
        .background(.gray)
        .sheet(isPresented: $showPurchaseSheet) {
            Spacer()
                .frame(height: 8)
            VStack {
                Text("Your Cart")
                    .font(.custom(.bold, size: 22))
                Spacer()
                    .frame(height: 8)
                Text("\(menuViewModel.getShoppingList().count) Items")
                    .font(.custom(.medium, size: 18))
                    .foregroundStyle(.gray)
                Spacer()
                    .frame(height: 16)
                VStack {
                    List {
                        ForEach(menuViewModel.getShoppingList(), id: \.title) { item in
                            MenuCardView(mainMenu: item, showBill: true)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(.white)
                }
                HStack {
                    VStack {
                        Text("Total")
                            .font(.custom(.bold, size: 16))
                        Text("$\(menuViewModel.getTotalPurchase())")
                            .font(.custom(.bold, size: 16))
                    }
                    Spacer()
                    
                    Button(action: {
                        //success animation
                        menuViewModel.savePurchaseOrder()
                        showPurchaseSheet.toggle()
                    }, label: {
                        if menuViewModel.getShoppingList().isEmpty {
                            Text("Checkout")
                                .foregroundStyle(.black)
                                .font(.custom(.bold, size: 16))
                        } else {
                            Text("Checkout")
                                .font(.custom(.bold, size: 16))
                                .padding()
                                .foregroundColor(.white)
                                .background(.orange)
                                .cornerRadius(100)
                        }
                    })
                    .disabled(menuViewModel.getShoppingList().isEmpty)
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 60)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .presentationDetents([.fraction(0.95)])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    PurchaseBottomSheetView(showPurchaseSheet: .constant(true), coffeeBackgroundColor: .constant("#ffa938"))
}
