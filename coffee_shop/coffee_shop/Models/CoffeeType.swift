//
//  CoffeeType.swift
//  coffee_shop
//
//  Created by Valery on 01.03.2025.
//

import Foundation

enum CoffeeType: String, CaseIterable, Codable {
    case milkCoffee = "milk_coffee"
    case plainCoffee = "plain_coffee"
    case matcha
    case special
}
