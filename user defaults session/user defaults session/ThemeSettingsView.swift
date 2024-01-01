//
//  ThemeSettingsView.swift
//  user defaults session
//
//  Created by Shehan Guruge on 2023-07-17.
//

import SwiftUI

struct ThemeSettingsView: View {
   @StateObject private var settingsVM = ThemeSettingsViewModel()
    var body: some View {
        ZStack {
            Color(settingsVM.color.cgColor ?? Color.white as! CGColor)
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                
                ColorPicker("Select a theme", selection: $settingsVM.color)
                    .onChange(of: settingsVM.color) { _ in
                        settingsVM.saveTheme()
                    }
                
                Button("Reset theme") {
                    settingsVM.removeTheme()
                }
            }
            .padding()
        }
        .ignoresSafeArea()
       
       
    }
}

struct ThemeSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSettingsView()
    }
}
