//
//  Persistence.swift
//  persistence
//
//  Created by Shehan Guruge on 2023-07-20.
//

import Foundation

class Persistance {
    static let shared = Persistance()
    private let userdefaults: UserDefaults
    
    private init() {
        self.userdefaults = UserDefaults.standard
    }
    
    enum UserDefaultKey: String {
        case bgColor
    }
    
    
    var bgColor: [CGFloat] {
        get {
            return userdefaults.array(forKey: UserDefaultKey.bgColor.rawValue) as? [CGFloat] ?? []
        }
        set {
            userdefaults.set(newValue, forKey: UserDefaultKey.bgColor.rawValue)
        }
    }
    
    
    func deleteValue(key: String) {
        userdefaults.removeObject(forKey: key)
    }
}
