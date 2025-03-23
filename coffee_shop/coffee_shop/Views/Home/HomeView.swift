//
//  HomeView.swift
//  coffee_shop
//
//  Created by Valery on 27.02.2025.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel: HomeViewModel = .init()
    @FocusState var searchFocused: Bool
    
    var body: some View {
        ScrollView {
            header
            coffeeTypeSelector
            coffeeTable
                .padding(.bottom, Constants.screenHeight / 10)
        }
        .background(
            background
        )
        .onTapGesture {
            searchFocused = false
        }
    }
    
    var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Location")
                    .foregroundStyle(.csGray)
                    .font(Constants.fontSora(14))
                HStack {
                    Text("Lviv, Ukraine")
                        .foregroundStyle(.white)
                        .font(Constants.fontSora(16))
                        .fontWeight(.semibold)
                        
                    Image(systemName: "chevron.down")
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                }
        
                SearchBar(input: $viewModel.searchPrompt, isFocused: $searchFocused)
            }
            .padding(.bottom, 70)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.csBlack)
        .overlay(
            Image("Banner")
                .padding(.bottom, -70),
            alignment: .bottom
        )
        .padding(.bottom, 70)
    }
    
    var coffeeTypeSelector: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                coffeeTypeTab(name: "All Coffee")
                    .onTapGesture {
                        viewModel.selectedCoffeeType = nil
                    }
                
                ForEach(CoffeeType.allCases, id: \.self) { type in
                    coffeeTypeTab(name: type.stringRepresentation)
                        .onTapGesture {
                            viewModel.selectedCoffeeType = type
                        }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
    
    var coffeeTable: some View {
        LazyVGrid(columns: [ GridItem(.adaptive(minimum: Constants.screenWidth / 2.2)) ], spacing: 15) {
            ForEach(viewModel.coffeeDrinks.filter { drink in
                if let selectedType = viewModel.selectedCoffeeType {
                    return drink.type.contains(selectedType)
                }
                return true
            }, id: \.self) { item in
                CoffeePreviewCard(coffee: item)
            }
        }
    }
    
    func coffeeTypeTab(name: String) -> some View {
        Text(name)
            .foregroundStyle(.csChocolate)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.csBeige)
            )
    }
    
    var background: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.csBackground)
            VStack {
                Rectangle()
                    .foregroundStyle(.csBlack)
                    .frame(height: Constants.screenHeight / 5)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
