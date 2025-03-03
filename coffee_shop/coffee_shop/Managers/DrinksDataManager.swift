//
//  DrinksDataManager.swift
//  coffee_shop
//
//  Created by Valery on 03.03.2025.
//

import Foundation

final class DrinksDataManager: ObservableObject {
    static let shared = DrinksDataManager()
    
    @Published private(set) var drinks: [CoffeeDrink] = []
    
    private let filename = "coffee_drinks"
    
    private init() {
        
    }
    
    private func loadDrinksFromFile() {
        if let url = Bundle.main.url(forResource: "cities", withExtension: "json") {
//            try {
//                
//            }
        }
    }
}
