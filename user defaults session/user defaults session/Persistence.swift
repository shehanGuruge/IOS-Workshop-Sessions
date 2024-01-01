//
//  Persistence.swift
//  Persistence user defaults
//
//  Created by Shehan Guruge on 2023-07-11.
//

import Foundation


class Persistance {
    private let defaults: UserDefaults
    private let decoder: JSONDecoder
    static let shared = Persistance()

    
    var appTheme: [CGFloat] {
        get {
            return defaults.array(forKey: CodingKeys.theme.rawValue) as? [CGFloat] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: CodingKeys.theme.rawValue)
        }
    }
    
    
    
    enum CodingKeys: String {
        case theme
    }
    
    
    private init() {
        self.defaults = UserDefaults.standard
        self.decoder = JSONDecoder()
    }
}


extension Persistance {
     func save<T: Codable>(key: String, value: T) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            defaults.set(encoded, forKey: key)
        }
    }
    
     func loadWithKey<T: Codable> (key: String) -> T? {
       if let savedObject = defaults.object(forKey: key) as? Data,
          let loadedObject = try? decoder.decode(T.self, from: savedObject) {
           return loadedObject
       }
       return nil
    }
    
    
    func loadArrayWithKey<T: Codable> (key: String) -> [T]? {
       if let savedObject = defaults.object(forKey: key) as? Data,
          let loadedObject = try? decoder.decode([T].self, from: savedObject) {
           return loadedObject
       }
       return []
    }
    
    func deleteForKey(key: String) {
        defaults.removeObject(forKey: key)
    }
}
