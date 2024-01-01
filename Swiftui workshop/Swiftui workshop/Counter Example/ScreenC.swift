//
//  ScreenC.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-28.
//

import SwiftUI

struct ScreenC: View {
    @EnvironmentObject var counterViewModel: CounterViewModel
    var body: some View {
        VStack {
            HStack {
                Button {
                    counterViewModel.decrementCounter()
                } label: {
                    Text("-")
                        .font(.system(size: 14.0))
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                }
                Text("Counter value: \(counterViewModel.counter)")
                Button {
                    counterViewModel.incrementCounter()
                } label: {
                    Text("+")
                        .font(.system(size: 14.0))
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                }
            }
        }.navigationTitle("Screen C")
    }
}

struct ScreenC_Previews: PreviewProvider {
    static var previews: some View {
        ScreenC()
            .environmentObject(CounterViewModel())
    }
}
