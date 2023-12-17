//
//  IconButton.swift
//  CoffeeUI
//
//  Created by Nico Molina on 06/12/2023.
//

import SwiftUI

struct IconButton: View {
    
    let action: () -> Void
    @Binding var coffeeBackgroundColor: String
    @State var iconColor = Color.white
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Image(systemName: "list.bullet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .font(.title.weight(.semibold))
                    .foregroundColor(iconColor)
                    .onChange(of: coffeeBackgroundColor) { oldColor, newColor in
                        withAnimation(.easeInOut(duration: 0)) {
                            if newColor == "#FFFFFF" {
                                iconColor = Color.black
                            } else {
                                iconColor = Color.white
                            }
                        }
                    }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

    }
}

#Preview {
    IconButton(action: {}, coffeeBackgroundColor: .constant("FFFFFF"))
}
