//
//  HomeView.swift
//  user defaults session
//
//  Created by Shehan Guruge on 2023-07-20.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("isEnabled") var isEnabled = true
    
    
    var body: some View {
        VStack {
            Toggle("Enable", isOn: $isEnabled)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
