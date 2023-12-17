//
//  MainButton.swift
//  CoffeeUI
//
//  Created by Nico Molina on 27/11/2023.
//

import Foundation
import SwiftUI

struct CartButtonView: View {
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                action()
            }, label: {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .font(.title.weight(.semibold))
                    .padding(10)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 4, x: 0, y: 4)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

struct CartButtonView_Previews:
    PreviewProvider {
    static var previews: some View {
        CartButtonView(action: {})
    }
}
