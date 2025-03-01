//
//  RootView.swift
//  coffee_shop
//
//  Created by Valery on 27.02.2025.
//

import SwiftUI

struct RootView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab = 0
    
    var body: some View {
        BottomNavigationView(selectedTab: $selectedTab)
    }
}

#Preview {
    RootView()
}
