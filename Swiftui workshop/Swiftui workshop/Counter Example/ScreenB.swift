//
//  ScreenB.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-28.
//

import SwiftUI

struct ScreenB: View {
    @EnvironmentObject var counterViewModel: CounterViewModel

    var body: some View {
        VStack {
            Text("Counter value: \(counterViewModel.counter)")
            NavigationLink ("Navigate to Screen C"){
                ScreenC()
            }
            .padding([.top], 30.0)
        }
        .navigationTitle("Screen B")
    }
}

struct ScreenB_Previews: PreviewProvider {
    static var previews: some View {
        ScreenB()
            .environmentObject(CounterViewModel())
    }
}
