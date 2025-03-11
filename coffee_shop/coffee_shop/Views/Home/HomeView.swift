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
            header
            Image("Banner")
            coffeeTypeSelector
            coffeeTable
        }
        .background(.csBackground)
    }
    
    var header: some View {
        VStack {
            Text("Location")
            Text("Lviv, Ukraine")
        }
        .frame(minWidth:Constants.screenWidth)
        .background(.csBlack)
    }
    
    var coffeeTypeSelector: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(CoffeeType.allCases, id: \.self) { type in
                    coffeeTypeTab(type: type)
                }
                
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
    
    var coffeeTable: some View {
        LazyVGrid(columns: [ GridItem(.adaptive(minimum: Constants.screenWidth / 2.2)) ], spacing: 15) {
            ForEach(viewModel.coffeeDrinks.filter {$0.type.contains(viewModel.selectedCoffeeType)}, id: \.self) { item in
                CoffeePreviewCard(coffee: item)
            }
        }
    }
    
    func coffeeTypeTab(type: CoffeeType) -> some View {
        Text(type.stringRepresentation)
            .foregroundStyle(.csChocolate)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.csBeige)
            )
            .onTapGesture {
                viewModel.selectedCoffeeType = type
            }
    }
}

#Preview {
    HomeView()
}
