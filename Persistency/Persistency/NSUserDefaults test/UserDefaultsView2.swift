//
//  UserDefaultsView2.swift
//  Persistency
//
//  Created by Shehan Guruge on 2023-07-05.
//

import SwiftUI

struct UserDefaultsView2: View {
    @State var people: [Person]?
    @AppStorage("Tap") var counter: Int?
    
    
    var body: some View {
        VStack {
            Text("Hello, World! \(counter ?? 0)")
            if(people != nil){
                List(people!){item in
                    Text(item.name)
                    
                }
            }
        }
        .onAppear {
            if let savedData =  UserDefaults.standard.object(forKey: "people") as? Data {
                do{
                     people = try JSONDecoder().decode([Person].self, from: savedData)
                } catch {
                }
            }
        }
    }
}

struct UserDefaultsView2_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsView2()
    }
}
