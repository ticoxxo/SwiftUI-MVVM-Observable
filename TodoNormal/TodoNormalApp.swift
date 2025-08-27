//
//  TodoNormalApp.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 03/06/25.
//

import SwiftUI

@main
struct TodoNormalApp: App {
    let persistentController = PersistentContainer.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentController.container.viewContext)
                
        }
    }
}

/*
 .environment(\.managedObjectContext, PersistentContainer.preview.container.viewContext)
 */
