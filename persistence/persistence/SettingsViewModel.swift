//
//  SettingsViewModel.swift
//  persistence
//
//  Created by Shehan Guruge on 2023-07-20.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    private let defaultBgColor: Color = Color.white
    @Published var backgroundColor: Color
    
    init() {
        self.backgroundColor = defaultBgColor
        loadBackgroundColor()
    }
    
    func saveBackgroundColor() {
        if(backgroundColor != defaultBgColor) {
            let colorData = UIColor(backgroundColor).cgColor
            if let components = colorData.components {
                Persistance.shared.bgColor = components
            }
        }
    }
    
    
    func loadBackgroundColor() {
        let bgArray = Persistance.shared.bgColor
        if(bgArray.count > 0) {
            let theme = Color(.sRGB,
                              red: bgArray[0],
                              green: bgArray[1],
                              blue: bgArray[2],
                              opacity: bgArray[3])
            backgroundColor = theme
        } else {
            backgroundColor = defaultBgColor
        }
    }
    
    
    func resetBackgroundColor() {
        Persistance.shared.deleteValue(key: Persistance.UserDefaultKey.bgColor.rawValue)
        loadBackgroundColor()
    }
    
}
