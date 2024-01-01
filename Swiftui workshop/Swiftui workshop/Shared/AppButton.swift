//
//  AppButton.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-27.
//

import SwiftUI

struct AppButton: View {
    var backgroundColor: Color = Color.blue
    var buttonTitle: String
    var onSubmit: () -> Void
    var body: some View {
        Button(action: onSubmit){
            Text(buttonTitle)
                .font(.system(size: 14.0))
                .bold()
                .padding()
                .background(backgroundColor)
                .cornerRadius(8)
                .foregroundColor(Color.white)
        }
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(buttonTitle: "GO", onSubmit: {})
    }
}
