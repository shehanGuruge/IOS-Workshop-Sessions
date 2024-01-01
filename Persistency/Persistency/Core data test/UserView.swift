//
//  UserView.swift
//  Persistency
//
//  Created by Shehan Guruge on 2023-07-06.
//

import SwiftUI

struct UserView: View {
    @State private var user: [User] = [User]()
    @State private var animal: [Animal] = [Animal]()
    let coreDm: CoredataManager = CoredataManager()
    
    private func populateUsers () {
        user = coreDm.getUsers()
    }
    
    private func populateAnimals () {
        animal = coreDm.getAnimals()
    }
    
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("Save") {
                coreDm.saveUser()
                populateUsers()
            }
            
            Button("Save Animal") {
                coreDm.saveAnimal()
                populateAnimals()
            }
            
            
            
            List(user) { u in
                HStack {
                    Text(u.name ?? "")
                    Text("\(u.age)")
                }
            }
            
//            List(animal) { u in
//                HStack {
//                    Text(u.name ?? "")
//                    Text(u.ofUser?.name ?? "")
//                }
//
//            }
            
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
