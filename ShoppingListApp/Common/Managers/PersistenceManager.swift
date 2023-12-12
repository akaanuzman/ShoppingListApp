//
//  PersistenceManager.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 12/12/23.
//

import Foundation


enum PersistenceManager {
    private static let defaults = UserDefaults.standard
    
    enum Keys {
        static let isFirstOpen = "isFirstOpen"
    }
    
    /// Checks if the app is opened for the first time
    ///  and if the app is opened for the second time and afterwards hide OnboardVC
    static var isFirstOpen: Bool {
        get {
            return defaults.bool(forKey: Keys.isFirstOpen)
        }
        set {
            defaults.set(newValue, forKey: Keys.isFirstOpen)
        }
    }
}
