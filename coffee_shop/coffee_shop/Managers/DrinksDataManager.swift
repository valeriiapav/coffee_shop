//
//  DrinksDataManager.swift
//  coffee_shop
//
//  Created by Valery on 03.03.2025.
//

import Foundation

@MainActor
final class DrinksDataManager: ObservableObject {
    static let shared = DrinksDataManager()
    
    @Published private(set) var drinks: [CoffeeDrink] = []
    
    private let filename = "coffee_drinks"
    
    private init() {
        loadDrinksFromFile()
    }
    
    private func loadDrinksFromFile() {
        if let url = Bundle.main.url(forResource: "cities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                drinks = try JSONDecoder().decode([CoffeeDrink].self, from: data)
            } catch {
                print("Error: Could not find cities.json in bundle")
            }
        }
    }
}
