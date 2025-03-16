//
//  SearchBar.swift
//  coffee_shop
//
//  Created by Valery on 15.03.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var input: String
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        TextField("", text: $input)
            .focused($isFocused)
            .frame(width: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.csSearchBar)
            )
            .overlay(
                Group {
                    if !isFocused && input.isEmpty {
                        HStack(spacing: 15) {
                            Image("search")
                                .foregroundStyle(.white)
                            Text("Search coffee")
                                .foregroundStyle(.csGray)
                                .font(Constants.fontSora(14))
                            Spacer()
                        }
                        .padding(.horizontal, 25)
                    }
                }
            )
            .onTapGesture {
                isFocused = true
            }
    }
}

#Preview {
    @Previewable @State var input: String = ""
    @FocusState var focused: Bool
    
    ZStack {
        Rectangle()
            .foregroundStyle(.gray)
            .ignoresSafeArea()
        
        SearchBar(
            input: $input,
            isFocused: $focused
        )
        .padding(.horizontal, 25)
    }
}
