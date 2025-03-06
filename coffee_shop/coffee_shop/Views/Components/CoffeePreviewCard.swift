//
//  CoffeePreviewCard.swift
//  coffee_shop
//
//  Created by Valery on 03.03.2025.
//

import SwiftUI

struct CoffeePreviewCard: View {
    let coffee: CoffeeDrink
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
            
            VStack {
                Image(coffee.asset)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                Spacer()
                
                VStack (alignment: .leading) {
                    Text(coffee.name)
                        .font(Constants.fontSora(16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.csBlack)
                    
                    Text(coffee.type.first?.stringRepresentation ?? "")
                        .font(Constants.fontSora(12))
                        .foregroundStyle(.csGray)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    HStack {
                        Text("$ \(String(format: "%.02f", coffee.price))")
                            .font(Constants.fontSora(18))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Spacer()
                        
                        Image("plus_square")
                    }
                }
                .padding()
                
            }
        }
        .frame(width: Constants.screenWidth / 2.4, height: Constants.screenHeight / 3.4)
    }
}

#Preview {
    ZStack {
        Rectangle()
            .foregroundStyle(Color.teal)
            .ignoresSafeArea()
        
        CoffeePreviewCard(coffee: PreviewDummies.drink)
    }
}
