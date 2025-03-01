//
//  TabModel.swift
//  coffee_shop
//
//  Created by Valery on 01.03.2025.
//

import Foundation

enum TabModel: Int, CaseIterable {
    case home = 0
    case favorites
    case order
    case profile
    
    var idleAsset: String {
        switch self {
        case .home:
            "home"
        case .favorites:
            "heart"
        case .order:
            "shop"
        case .profile:
            "notification"
        }
    }
    
    var selectedAsset: String {
        self.idleAsset + "_selected"
    }
}
