//
//  Settings.swift
//  User defaults-test2
//
//  Created by Shehan Guruge on 2023-07-11.
//

import Foundation

enum StorageKeys: String {
    case username, user
}

struct Settings {
    @Persistance(key: StorageKeys.username.rawValue, defaultValue: nil)
    static var userName: String?
    
    @Persistance(key: StorageKeys.user.rawValue, defaultValue: User(id: 1, name: ""))
    static var user: User?
    
    @Persistance(key: StorageKeys.user.rawValue, defaultValue: [])
    static var users: [User]?
}
