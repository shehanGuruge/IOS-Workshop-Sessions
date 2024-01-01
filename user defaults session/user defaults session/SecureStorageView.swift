//
//  SecureStorageView.swift
//  user defaults session
//
//  Created by Shehan Guruge on 2023-07-20.
//

import SwiftUI
import KeychainSwift

struct SecureStorageView: View {
    @State var isEnabled: Bool = true
    private let keychain = KeychainSwift()
    var body: some View {
        Toggle("Enable", isOn: $isEnabled)
            .onAppear {
                isEnabled = keychain.getBool("isEnabled") ?? true
            }
            .onDisappear {
                keychain.set(isEnabled, forKey: "isEnabled")
            }
    }
}

struct SecureStorageView_Previews: PreviewProvider {
    static var previews: some View {
        SecureStorageView()
    }
}
