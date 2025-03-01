//
//  BottomNavigationView.swift
//  coffee_shop
//
//  Created by Valery on 01.03.2025.
//

import SwiftUI

struct BottomNavigationView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                
                FavoritesView()
                    .tag(1)
                
                OrdersView()
                    .tag(2)
                
                ProfileView()
                    .tag(3)
            }
            
            HStack {
                ForEach((TabModel.allCases), id: \.self) { item in
                    customTabItem(model: item, isActive: selectedTab == item.rawValue)
                        .onTapGesture {
                            withAnimation {
                                selectedTab = item.rawValue}
                        }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func customTabItem(model: TabModel, isActive: Bool) -> some View {
        return VStack {
            Image(isActive ? model.selectedAsset : model.idleAsset)
            
            if isActive {
                Image("selection")
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    @Previewable @State var tab: Int = 0
    BottomNavigationView(
        selectedTab: $tab
    )
}
