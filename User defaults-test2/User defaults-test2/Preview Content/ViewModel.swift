//
//  ViewModel.swift
//  User defaults-test2
//
//  Created by Shehan Guruge on 2023-07-11.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var userName: String?
    @Published var users: [User]? = []
    
    init() {
        userName = Settings.userName
        loadUserList()
    }
    
    func setUserName() {
        Settings.userName = "Shehan \(Int.random(in: 0...100))"
        loadUserName()
    }
    
    func loadUserName() {
        userName = Settings.userName
    }
    
    func deleteUserName() {
        Settings.userName = nil
        loadUserName()
    }
    
    func loadUserList() {
        print(Settings.users)
        users = Settings.users
    }
    
    func addUserToList() {
        var user = User(id: Int.random(in: 0...100), name: "New User \(Int.random(in: 0...100))")
        Settings.users?.append(user)
        print("Count \(users?.count)")
//        Settings.users? = users!
        loadUserList()
    }
    
    func deleteUserList() {
        Settings.users = nil
        loadUserList()
    }
}


struct User: Codable, Identifiable {
    let id: Int
    let name: String
}
