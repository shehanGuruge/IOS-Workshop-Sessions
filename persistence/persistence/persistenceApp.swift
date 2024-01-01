//
//  persistenceApp.swift
//  persistence
//
//  Created by Shehan Guruge on 2023-07-20.
//

import SwiftUI

@main
struct persistenceApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            UserDefaultsView()
//            SettingsView()
            KeychainView()
        }
    }
}
