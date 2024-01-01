//
//  UserDefaultsView.swift
//  persistence
//
//  Created by Shehan Guruge on 2023-07-20.
//

import SwiftUI

struct UserDefaultsView: View {
    @AppStorage("isEnabled") var isEnabled: Bool = true
    var body: some View {
        VStack {
            Text("User defaults")
            Toggle("Enable/Disable", isOn: $isEnabled)
        }
        .padding()
       
    }
}

struct UserDefaultsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsView()
    }
}
