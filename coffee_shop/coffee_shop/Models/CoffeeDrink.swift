//
//  CofeeDrink.swift
//  coffee_shop
//
//  Created by Valery on 01.03.2025.
//

import Foundation


struct CoffeeDrink: Codable {
    let type: [CoffeeType]
    let name: String
    let asset: String
    let description: String
    let price: Double
    let addition: String
    let rating: Double
}
