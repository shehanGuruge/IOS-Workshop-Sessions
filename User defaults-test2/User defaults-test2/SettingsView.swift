//
//  SettingsView.swift
//  User defaults-test2
//
//  Created by Shehan Guruge on 2023-07-11.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack {
            HStack {
                
                Toggle("Dark Mode", isOn: ) {
                    
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
