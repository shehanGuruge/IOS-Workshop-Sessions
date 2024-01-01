//
//  UserDefaultsView1.swift
//  Persistency
//
//  Created by Shehan Guruge on 2023-07-05.
//4

import SwiftUI
import Foundation

struct Person: Identifiable, Codable {
    let name: String
    let age: Int
    let id: Int
}

struct UserDefaultsView1: View {
    @State var counter: Int = 0
    @State private var people: [Person] = []
    var body: some View {
        NavigationView {
            HStack {
                Text("\(counter)")
                Button("+") {
                    counter += 1
                    people.append(Person(name: "Shehan", age: 10, id: Int.random(in: 1..<100)))
                    
                    UserDefaults.standard.set(self.counter, forKey: "Tap")
                    
                    do {
                        let json = try JSONEncoder().encode(people)
                        if let jsonString = String(data: json, encoding: .utf8) {
                                            print(jsonString)
                                        }
                        UserDefaults.standard.set(json, forKey: "people")
                    } catch {
                        
                    }
                }
                
                NavigationLink("Go to screen B") {
                    UserDefaultsView2()
                }
            }
        }
    }
}

struct UserDefaultsView1_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsView1()
    }
}
