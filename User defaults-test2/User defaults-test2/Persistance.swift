//
//  Persistance.swift
//  User defaults-test2
//
//  Created by Shehan Guruge on 2023-07-11.
//

import Foundation

@propertyWrapper
struct Persistance<T: Codable> {
   private let key: String
   private let defaultValue: T?

    init(key: String, defaultValue: T?) {
       self.key = key
       self.defaultValue = defaultValue
   }

   var wrappedValue: T? {
       get {
           guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
               return defaultValue
           }
           print(data)
           let value = try? JSONDecoder().decode(T.self, from: data)
           return value ?? defaultValue
       }
       set {
           if(newValue == nil) {
               delete()
           } else {
               let data = try? JSONEncoder().encode(newValue)
               UserDefaults.standard.set(data, forKey: key)
           }
       }
   }
    
    func delete() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}



//@propertyWrapper
//struct ArrayPersistance<T: Codable> {
//   private let key: String
//   private let defaultValue: [T]?
//
//    init(key: String, defaultValue: [T]?) {
//       self.key = key
//       self.defaultValue = defaultValue
//   }
//
//   var wrappedValue: [T]? {
//       get {
//           guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
//               return defaultValue
//           }
//           
//          print("GEETTING")
//           let value = try? JSONDecoder().decode([T].self, from: data)
//           print("GOT FDATA \(value ?? defaultValue)" )
//           return value ?? defaultValue
//       }
//       set {
//           if(newValue == nil) {
//               delete()
//           } else {
//               print("SAVING NEW VALUE")
//               let data = try? JSONEncoder().encode(newValue)
//               UserDefaults.standard.set(data, forKey: key)
//           }
//       }
//   }
//    
//    func delete() {
//        UserDefaults.standard.removeObject(forKey: key)
//    }
//}
