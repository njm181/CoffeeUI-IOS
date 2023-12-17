//
//  OrderHistoryBottomSheet.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import SwiftUI

struct OrderHistoryBottomSheet: View {
    @EnvironmentObject var menuViewModel: MenuViewModel
    @Binding var showOrderHistorySheet: Bool
    @Binding var coffeeBackgroundColor: String

//    init(){
//        self.menuViewModel.getOrderHistories()
//    }
    
    var body: some View {
        VStack {}
            .sheet(isPresented: $showOrderHistorySheet) {
                //OrderHistoryItemCard()
                VStack {
                    Text("Order History")
                        .font(.custom(.bold, size: 22))
                    Spacer()
                        .frame(height: 20)
                    List {
                        ForEach(Array(menuViewModel.orders.enumerated()), id: \.element.id) { index, item in
                            OrderHistoryItemCard(order: item, index: index+1 )
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, 20)
                .presentationDetents([.fraction(0.95)])
                .presentationDragIndicator(.visible)
                .onChange(of: showOrderHistorySheet) { oldValue, newValue in
                    coffeeBackgroundColor = "#ffa938"
                }
            }
    }
}

#Preview {
    OrderHistoryBottomSheet(showOrderHistorySheet: .constant(true), coffeeBackgroundColor: .constant("#ffa938"))
}
