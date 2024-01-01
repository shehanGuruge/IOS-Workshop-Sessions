//
//  CounterViewB.swift
//  Session 5
//
//  Created by Shehan Guruge on 2023-06-29.
//

import SwiftUI

struct CounterViewB: View {
    @EnvironmentObject var counterViewModel: CounterViewModel
    var body: some View {
        VStack {
            Text("Counter Value: \(counterViewModel.counter)")
            NavigationLink("Navigate to Screen C") {
                CounterViewC()
            }
            .padding()
        }
        .navigationTitle("Screen B")
    }
}

struct CounterViewB_Previews: PreviewProvider {
    static var previews: some View {
        CounterViewB().environmentObject(CounterViewModel())
    }
}
