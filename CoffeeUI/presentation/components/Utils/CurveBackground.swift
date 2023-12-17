//
//  CurveBackground.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import SwiftUI

struct CurveBackground: View {
    @Binding var coffeeBackgroundColor: String
    
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(
                cornerRadii: .init(bottomLeading: 250, bottomTrailing: 250)
            )
            .fill(Color.init(hex: coffeeBackgroundColor))
            .frame(maxWidth: .infinity, maxHeight: 200)
            .onChange(of: coffeeBackgroundColor) { oldColor, newColor in
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.coffeeBackgroundColor = newColor
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    CurveBackground(coffeeBackgroundColor: .constant("#8b6969"))
}
