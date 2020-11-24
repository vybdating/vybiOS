//
//  Vyb_DatingApp.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI
import CoreData

@main
struct Vyb_DatingApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeTabController().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        
    }


}

