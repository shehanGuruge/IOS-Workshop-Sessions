//
//  ViewModel.swift
//  Swiftui workshop
//
//  Created by Shehan Guruge on 2023-06-28.
//

import Foundation


class CounterViewModel: ObservableObject {
    @Published var counter: Int = 0
    
    func incrementCounter() {
        counter += 1
    }
    
    func decrementCounter() {
        counter -= 1
    }
}
