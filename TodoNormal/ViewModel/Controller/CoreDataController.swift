//
//  CoreDataController.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 15/08/25.
//
import Foundation
import CoreData

@MainActor
struct PersistentContainer {
    
    static let shared = PersistentContainer()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: "TodoNormal")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    static var preview: PersistentContainer = {
        let controller = PersistentContainer(inMemory: true)
        let context = controller.container.viewContext
        
        for index in 0..<3 {
            let task = CDReminder(title: "New reminder \(index)", descriptor: "New descriptor", context: context)
        }
        
        let withItems = CDReminder(title: "With items", descriptor: "This reminder has items", context: context)
        withItems.tasks.insert(CDReminderItem(descriptor: "First item", dueDate: Date().addDays(2) , context: context))
        
        return controller
    }()
    
}
