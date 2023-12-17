//
//  OrderHistoryItemCard.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import SwiftUI

struct OrderHistoryItemCard: View {
    
    var order: OrderHistory
    var index: Int
    @State private var isDisclosed = false
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack {
                    Text("Order:")
                        .font(.custom(.bold, size: 20))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(String(index))
                        .font(.custom(.bold, size: 20))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                Button(
                    action: {
                        withAnimation {                                    
                            isDisclosed.toggle()
                        }
                    },
                    label: {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                    }
                )
                .buttonStyle(.plain)
                .frame(width: 50, height: 50)
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                ForEach(order.historyOrders.sorted(by: <), id: \.key) { key, value in
                    HStack {
                        Text(key)
                            .font(.custom(.medium, size: 16))
                            .foregroundStyle(.white)
                        Spacer()
                        Text("\(value)x")
                            .font(.custom(.medium, size: 16))
                            .foregroundStyle(.white)
                    }
                    .padding(4)
                }
            }
            .frame(height: isDisclosed ? nil : 0)
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipped()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.orange)
        .cornerRadius(5)
//        .onTapGesture {
//            isDisclosed.toggle()
//        }
    }
}

#Preview {
    OrderHistoryItemCard(order: OrderHistory(), index: 1)
    //OrderHistoryItemCard(historyOrders: OrderHistory(historyOrders: [1,2,3]))
}
