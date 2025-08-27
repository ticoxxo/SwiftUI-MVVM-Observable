//
//  HomeViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import Foundation
import CoreData
import SwiftUI

extension Home {
    
    @MainActor
    class ViewModel: ObservableObject {
        
        private(set) var context: NSManagedObjectContext
        
        @Published var reminders: [CDReminder] = []
    
        convenience init() {
            let defaultContext = PersistentContainer.shared.container.viewContext
            self.init(context: defaultContext)
        }

        
        init(context: NSManagedObjectContext) {
            
            self.context = context
        }
        
        
        func setContext(context: NSManagedObjectContext) {
            self.context = context
        }
        
        
        func fetchReminders() {
            let request: NSFetchRequest<CDReminder> = CDReminder.fetch()
            do {
                let results = try context.fetch(request)
                self.reminders = results
                print("Fetched \(results.count) reminders.")
            } catch {
                print("Error fetching reminders: \(error.localizedDescription)")
            }
        }
        
    }
}





