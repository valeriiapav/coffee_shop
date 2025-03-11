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
            coffeeTypeSelector
            coffeeTable
        }
        .background(
            background
        )
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
                .padding(.bottom, 70)
            }
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
    
    var background: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.csBackground)
            VStack {
                Rectangle()
                    .foregroundStyle(.csBlack)
                    .frame(height: Constants.screenHeight / 10)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
