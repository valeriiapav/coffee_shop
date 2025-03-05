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
        Text("This is home")
    }
}

#Preview {
    HomeView()
}
