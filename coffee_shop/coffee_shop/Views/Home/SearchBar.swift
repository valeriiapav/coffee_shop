//
//  SearchBar.swift
//  coffee_shop
//
//  Created by Valery on 15.03.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var prompt: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    @Previewable @State var prompt: String = ""
    
    ZStack {
        Rectangle()
            .foregroundStyle(.gray)
            .ignoresSafeArea()
        
        SearchBar(
            prompt: $prompt
        )
    }
}
