//
//  KeychainView.swift
//  persistence
//
//  Created by Shehan Guruge on 2023-07-20.
//

import SwiftUI
import KeychainSwift

struct KeychainView: View {
    @State private var isEnabled: Bool = true
    private var keychain = KeychainSwift()
    
    var body: some View {
        Toggle("Enable/Disable", isOn: $isEnabled)
            .onAppear {
                isEnabled = keychain.getBool("isEnabled") ?? true
            }
            .onDisappear {
                keychain.set(isEnabled, forKey: "isEnabled")
            }
    }
}

struct KeychainView_Previews: PreviewProvider {
    static var previews: some View {
        KeychainView()
    }
}
