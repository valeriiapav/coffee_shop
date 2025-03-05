//
//  Constants.swift
//  coffee_shop
//
//  Created by Valery on 01.03.2025.
//

import UIKit
import SwiftUI

@MainActor
final class Constants {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
    
    static func fontSora(_ size: CGFloat) -> Font {
        return .custom("Sora", size: size)
    }
}

@MainActor
final class PreviewDummies {
    static let drink = CoffeeDrink(
        type: [.matcha, .milkCoffee],
        name: "Matcha latte",
        asset: "matcha_latte",
        description: "Includes lactose-free milk",
        price: 3.5,
        addition: "dish contains allergen",
        rating: 4.9
    )
}
