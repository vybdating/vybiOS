//
//  PersistenceController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 23/11/2020.
//

import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    //MARK: save data to daabase
    func saveContext () {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show the error here
            }
        }
    }
    
    //MARK: init 
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "VybDating")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

