//
//  CounterViewA.swift
//  Session 5
//
//  Created by Shehan Guruge on 2023-06-29.
//

import SwiftUI

struct CounterViewA: View {
    @StateObject var counterViewModel = CounterViewModel()
    var body: some View {
        NavigationView{
            VStack {
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
                
                NavigationLink("Navigate to Screen B") {
                    CounterViewB()
                }
            }
        }
        .environmentObject(counterViewModel)
    }
}

struct CounterViewA_Previews: PreviewProvider {
    static var previews: some View {
        CounterViewA()
    }
}
