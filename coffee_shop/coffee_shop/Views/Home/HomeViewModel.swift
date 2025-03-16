//
//  HomeViewModel.swift
//  coffee_shop
//
//  Created by Valery on 03.03.2025.
//

import Foundation

@Observable class HomeViewModel {
    let coffeeDrinks: [CoffeeDrink]
    
    var selectedCoffeeType: CoffeeType? = nil
    var searchPrompt: String = ""
    
    init() {
        coffeeDrinks = DrinksDataManager.shared.drinks
    }
}
