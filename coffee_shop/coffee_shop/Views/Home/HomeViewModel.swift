//
//  HomeViewModel.swift
//  coffee_shop
//
//  Created by Valery on 03.03.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    let coffeeDrinks: [CoffeeDrink]
    
    init() {
        coffeeDrinks = DrinksDataManager.shared.drinks
    }
}
