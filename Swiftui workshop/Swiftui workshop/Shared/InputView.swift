//
//  InputView.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-27.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    var placeholder: String = "Type here"
    var body: some View {
        HStack(){
            TextField(placeholder,
                      text: $text)
                .padding()
                .overlay(RoundedRectangle(cornerRadius:8)
                    .stroke(Color.gray.opacity(0.5)))
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""))
    }
}
