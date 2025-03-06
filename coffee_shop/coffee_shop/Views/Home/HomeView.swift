//
//  HomeView.swift
//  coffee_shop
//
//  Created by Valery on 27.02.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = .init()
    
    var body: some View {
        ScrollView {
            coffeeTable
        }
    }
    
    var coffeeTable: some View {
        LazyVGrid(columns: [ GridItem(.adaptive(minimum: Constants.screenWidth / 2.2)) ], spacing: 15) {
            ForEach(viewModel.coffeeDrinks, id: \.self) { item in
                CoffeePreviewCard(coffee: item)
            }
        }
    }
}

#Preview {
    HomeView()
}
