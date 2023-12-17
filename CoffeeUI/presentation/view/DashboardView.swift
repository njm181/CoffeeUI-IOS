//
//  DashboardView.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    
    var body: some View {
        DashboardContent()
    }
}

struct DashboardContent: View {
    @EnvironmentObject var menuViewModel: MenuViewModel
    @State private var showPurchaseSheet: Bool
    @State private var showOrderHistorySheet: Bool
    @State private var coffeeBackgroundColor: String
    @State var drinksListVisibility: Bool
    
    init(
        showPurchaseSheet: Bool = false,
        showOrderHistorySheet: Bool = false,
        coffeeBackgroundColor: String = "",
        drinksListVisibility: Bool = true
    ) {
        self.showPurchaseSheet = showPurchaseSheet
        self.showOrderHistorySheet = showOrderHistorySheet
        self.drinksListVisibility = drinksListVisibility
        self.coffeeBackgroundColor = coffeeBackgroundColor
    }
    
    var body: some View {
        VStack() {
            VStack {
                ZStack {
                    CurveBackground(coffeeBackgroundColor: $coffeeBackgroundColor)
                    VStack {
                        Spacer()
                            .frame(height: 30)
                        CoffeeCarouselView(
                            coffeesList: menuViewModel.providerMenuData.coffeeList,
                            coffeeBackgroundColor: $coffeeBackgroundColor
                        )
                    }
                    .frame(maxWidth: .infinity)
                    IconButton(
                        action: {
                            showOrderHistorySheet.toggle()
                            menuViewModel.getOrderHistories()
                        }, 
                        coffeeBackgroundColor: $coffeeBackgroundColor)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            VStack {
                SegmentMenuPickerView(drinksListVisibility: $drinksListVisibility)
                VStack {
                    //build list component
                    ZStack {
                        if drinksListVisibility {
                            List {
                                ForEach(menuViewModel.providerMenuData.drinkList, id: \.title) { drink in
                                    MenuCardView(mainMenu: drink)
                                        .listRowSeparator(.hidden)
                                }
                            }
                            .listStyle(PlainListStyle())
                            .background(.white)
                        } else {
                            List {
                                ForEach(menuViewModel.providerMenuData.donutList, id: \.title) { donut in
                                    MenuCardView(mainMenu: donut)
                                        .listRowSeparator(.hidden)
                                }
                            }
                            .listStyle(PlainListStyle())
                            .background(.white)
                        }
                        //build list component
                        CartButtonView {
                            showPurchaseSheet.toggle()
                        }
                    }
                    PurchaseBottomSheetView(
                        showPurchaseSheet: $showPurchaseSheet,
                        coffeeBackgroundColor: $coffeeBackgroundColor
                    )
                    OrderHistoryBottomSheet(
                        showOrderHistorySheet: $showOrderHistorySheet,
                        coffeeBackgroundColor: $coffeeBackgroundColor
                    )
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .onAppear{
            self.coffeeBackgroundColor = self.menuViewModel.providerMenuData.coffeeList.first?.imageBackground ?? "#ffa938"
        }
    }
}

#Preview {
    DashboardView()
        //.modelContainer(for: [MainMenu.self, OrderHistory.self], inMemory: true)
}

