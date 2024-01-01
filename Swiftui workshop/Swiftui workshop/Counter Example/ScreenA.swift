//
//  ScreenA.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-28.
//

import SwiftUI

struct ScreenA: View {
    @StateObject var counterViewModel: CounterViewModel = CounterViewModel()
    
    var body: some View {
        NavigationView {
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
                    
                    
                    Text("\(counterViewModel.counter)")
                        .padding([.leading, .trailing], 20.0)
                    
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
                
                
                NavigationLink("Navigate to Screen B") {
                    ScreenB()
                }
                .padding([.top], 50.0)
                
            }
            .navigationTitle("Screen A")
        }
        .environmentObject(CounterViewModel())
        .environmentObject(CounterViewModel())
    }
}

struct ScreenA_Previews: PreviewProvider {
    static var previews: some View {
        ScreenA()
    }
}
