//
//  Font+Extension.swift
//  CoffeeUI
//
//  Created by Nico Molina on 30/11/2023.
//

import Foundation
import SwiftUI

extension Font {
    static func custom(_ font: CustomFonts, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
