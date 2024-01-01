//
//  CoredataManager.swift
//  Persistency
//
//  Created by Shehan Guruge on 2023-07-06.
//

import Foundation
import CoreData
import EncryptedCoreData
import SQLCipher

class CoredataManager {
    let persistentManager: NSPersistentContainer
    
    
    
    init() {
        let momdName = "UserModel"
//        persistentManager = NSPersistentContainer(name: "UserModel")
        let passphrase = "YourEncryptionPassphrase"
        let storeDescription = NSPersistentStoreDescription()
        storeDescription.shouldInferMappingModelAutomatically = true
        storeDescription.shouldMigrateStoreAutomatically = true
        storeDescription.type = NSSQLiteStoreType

    
        let storeURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first?.appendingPathComponent("UserModel.sqlite")
        
        storeDescription.url = storeURL
        storeDescription.setOption(passphrase as NSObject, forKey: NSPersistentStoreFileProtectionKey)
      
//        storeDescription.setOption(FileProtectionType.complete as NSObject, forKey: NSPersistentStoreFileProtectionKey)
    
        persistentManager = NSPersistentContainer(name: "UserModel")
        persistentManager.persistentStoreDescriptions = [storeDescription]
    
        persistentManager.loadPersistentStores { description, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    
    func saveUser() {
        let user = User(context: persistentManager.viewContext)
        user.name = "Shehan"
        user.age = Int64(Int.random(in: 5...60))
        
        do {
            try persistentManager.viewContext.save()
        } catch {
            
        }
    }
    
    func saveAnimal() {
//        let user = User(context: persistentManager.viewContext)
//        user.name = "Dog Owner"
//        user.age = 50
//        
        
        let animal = Animal(context: persistentManager.viewContext)
        animal.name = "Doggy"
        animal.type = "Dog"
//        animal.ofUser = user
//
//        user.animal = animal
        
        do {
            try persistentManager.viewContext.save()
        } catch {
            
        }
    }
    
    func getAnimals() -> [Animal] {
        let fetchRequest: NSFetchRequest<Animal> = Animal.fetchRequest()
//        fetchRequest.predicate = Animal.key
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "age", ascending: true)]
        do {
           return try persistentManager.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    
    func getUsers() -> [User] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K <= 30 AND %K == %@", "age", "name", "Shehan")
     
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "age", ascending: true)]
        do {
           return try persistentManager.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
}
