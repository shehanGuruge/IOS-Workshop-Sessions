//
//  CounterViewC.swift
//  Session 5
//
//  Created by Shehan Guruge on 2023-06-29.
//

import SwiftUI

struct CounterViewC: View {
    @EnvironmentObject var counterViewModel: CounterViewModel
    var body: some View {
        HStack {
            Button("-") {
                counterViewModel.decrementCounter()
            }
            
            Text("Counter: \(counterViewModel.counter)")
                .padding()
            
            Button("+"){
                counterViewModel.incrementCounter()
            }
        }
    }
}

struct CounterViewC_Previews: PreviewProvider {
    static var previews: some View {
        CounterViewC()
            .environmentObject(CounterViewModel())
    }
}
