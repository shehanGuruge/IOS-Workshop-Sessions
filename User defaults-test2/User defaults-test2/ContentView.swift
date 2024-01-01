//
//  ContentView.swift
//  User defaults-test2
//
//  Created by Shehan Guruge on 2023-07-11.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack {
//            Text(vm.userName ?? "")
           
            
            if(vm.users != nil) {
                List(vm.users!) { u in
                    Text(u.name)
                }
            }
            
            Button("Save user name") {
                vm.setUserName()
            }
            Button("Add User") {
                vm.addUserToList()
            }
            Button("Delete") {
                vm.deleteUserList()
            }
        }
        .onAppear {
//            vm.loadUserList()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
