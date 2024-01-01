//
//  SettingsView.swift
//  persistence
//
//  Created by Shehan Guruge on 2023-07-20.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var settingsViewModel = SettingsViewModel()
    var body: some View {
        ZStack {
            Color(settingsViewModel.backgroundColor.cgColor ?? Color.white as! CGColor)
            VStack {
                ColorPicker("Pick the background color", selection: $settingsViewModel.backgroundColor)
                    .onChange(of: settingsViewModel.backgroundColor) { _ in
                        settingsViewModel.saveBackgroundColor()
                    }
                
                
                Button("Reset background color") {
                    settingsViewModel.resetBackgroundColor()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
