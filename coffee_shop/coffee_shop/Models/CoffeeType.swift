//
//  CoffeeType.swift
//  coffee_shop
//
//  Created by Valery on 01.03.2025.
//

import Foundation

enum CoffeeType: String, CaseIterable, Codable {
    case all
    case milkCoffee = "milk_coffee"
    case plainCoffee = "plain_coffee"
    case matcha
    case special
    
    var stringRepresentation: String {
        switch self {
            
        case .milkCoffee:
            "Milk Coffee"
        case .plainCoffee:
            "Dark Coffee"
        case .matcha:
            "Matcha"
        case .special:
            "Special"
        case .all:
            "All Coffee"
        }
    }
}
