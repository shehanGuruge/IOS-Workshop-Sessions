//
//  ThemeSettingsViewModel.swift
//  user defaults session
//
//  Created by Shehan Guruge on 2023-07-17.
//

import Foundation
import SwiftUI

class ThemeSettingsViewModel: ObservableObject {
    private let defaultColor: Color = Color.white
    @Published var color: Color

    init() {
        self.color = defaultColor
        loadTheme()
    }
    
    func saveTheme() {
        if(color != defaultColor){
            let colorData = UIColor(color).cgColor
            if let components = colorData.components {
                Persistance.shared.appTheme = components
            }
        }
    }
    
    
    func loadTheme() {
        let themeArray = Persistance.shared.appTheme
        if(themeArray.count > 0){
            let theme = Color(.sRGB,
                          red: themeArray[0],
                          green: themeArray[1],
                          blue: themeArray[2],
                          opacity: themeArray[3])
            color = theme
        } else {
            color = defaultColor
        }
    }
    
    
    func removeTheme() {
        Persistance.shared.deleteForKey(key: Persistance.CodingKeys.theme.rawValue)
        loadTheme()
    }
}
