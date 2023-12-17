//
//  SegmentMenuPicker.swift
//  CoffeeUI
//
//  Created by Nico Molina on 27/11/2023.
//

import Foundation
import SwiftUI


struct SegmentMenuPickerView: View {
    
    //@State private var selectedMenu = ""
    @State private var selectedSegment = "Drinks"
    @Binding var drinksListVisibility: Bool
    var starters = ["Drinks", "Donuts"]
    
    
    var body: some View {
        VStack {
            Picker(
                "SegmentMenuPicker",
                selection: $selectedSegment//$selectedMenu
            ) {
                ForEach(starters, id: \.self) {
                    Text($0)
                        //.foregroundStyle(.white)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .onAppear(){
                UISegmentedControl.appearance().selectedSegmentTintColor = .orange
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
                UISegmentedControl.appearance().backgroundColor = UIColor.clear.withAlphaComponent(0.0)
            }
            .onChange(of: selectedSegment) { oldValue, newValue in
                if newValue == "Drinks" {
                    drinksListVisibility = true
                } else {
                    drinksListVisibility = false
                }
            }
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .padding(.horizontal, 8)
        
    }
}

struct SegmentMenuPickerView_Preview:
    PreviewProvider {
    static var previews: some View {
        SegmentMenuPickerView(drinksListVisibility: .constant(true))
    }
}
