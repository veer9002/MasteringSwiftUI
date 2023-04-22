//
//  SettingStore.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 21/04/23.
//

import Foundation
import Combine

enum DisplayOrderType: Int, CaseIterable {

    case alphabetical = 0
    case favoritesFirst = 1
    case checkInFirst = 2
    
    init(type: Int) {
        switch type {
        case 0: self = .alphabetical
        case 1: self = .favoritesFirst
        case 2: self = .checkInFirst
        default: self = .alphabetical
        }
    }
    
    var text: String {
        switch self {
        case .alphabetical:
            return "Alphabetical"
        case .favoritesFirst:
            return "Show Favorites First"
        case .checkInFirst:
            return "Show Check-in First"
        }
    }
    
    func predicate() -> ((RestaurantForm, RestaurantForm) -> Bool) {
        switch self {
        case .alphabetical:
            return { $0.name < $1.name }
        case .favoritesFirst: return { $0.isFavorite && !$1.isFavorite }
        case .checkInFirst: return { $0.isCheckIn && !$1.isCheckIn }
        }
    }
    
}


final class SettingStore: ObservableObject {
    
    init() {
        UserDefaults.standard.register(defaults: ["view.preferences.showCheckInOnly" : false,
                                       "view.preferences.displayOrder" : 0,
                                       "view.preferences.maxPriceLevel" : 5])
    }
    
    
    @Published var showCheckinOnly: Bool = UserDefaults.standard.bool(forKey: "view.preferences.showCheckInOnly") {
        didSet {
            UserDefaults.standard.set(showCheckinOnly, forKey: "view.preferences.showCheckInOnly")
        }
    }
    
    @Published var displayOrder: DisplayOrderType = DisplayOrderType(type: UserDefaults.standard.integer(forKey: "view.preferences.displayOrder")) {
        didSet {
            UserDefaults.standard.set(displayOrder.rawValue, forKey: "view.preferences.displayOrder")
        }
    }
    
    @Published var maxPriceLevel: Int = UserDefaults.standard.integer(forKey: "view.preferences.maxPriceLevel") {
        didSet {
            UserDefaults.standard.set(maxPriceLevel, forKey: "view.preferences.maxPriceLevel")
        }
    }
    
    
}
