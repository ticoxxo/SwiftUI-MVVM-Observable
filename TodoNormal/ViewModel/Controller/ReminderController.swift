//
//  ReminderController.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI
import Observation

@MainActor
@Observable
final class ReminderController {
    
    private let fileURL = URL.documentsDirectory.appendingPathComponent("remindersList").appendingPathExtension("json")
        
    var reminders: [Reminder]
    
    var selectedReminder: Reminder?
    var selectedReminderItem: ReminderItem?
    
    init() {
        guard let data = try? Data(contentsOf: fileURL),
        let reminders = try? JSONDecoder().decode([Reminder].self, from: data) else {
            self.reminders = PreviewStore.shared
            return
        }
        print(fileURL)
        self.reminders = reminders
    }
    
}

extension ReminderController {
    
    func setSelectedReminder(_ reminder: Reminder?) {
        guard let reminder else{
            self.selectedReminder = nil
            return
        }
        
        self.selectedReminder = reminder
        
    }
    
    //subscript to access reminders by UUID
    subscript(withId id: UUID) -> Reminder? {
        guard let index = self.reminders.firstIndex(where: { $0.id == id }) else {
            return nil
        }
         return self.reminders[index]
    }
    
    //subscript to return index of reminder by UUID
    subscript(indexOfId id: UUID) -> Int? {
        guard let exist = self.reminders.firstIndex(where: { $0.id == id }) else {
            print("Reminder not found")
            return nil
        }
        
        return exist
    }
    
    func saveNewReminder(_ reminder: Reminder) {
        self.reminders.append(reminder)
        saveFile()
    }
    
    func updateReminder(_ reminder: Reminder) {
        guard let exist = self[indexOfId: reminder.id] else {
            print("Reminder not found for update")
            
            return
        }
        
        self.reminders[exist] = reminder
        saveFile()
    }
    
   
    func saveFile() {
        do {
            let data = try JSONEncoder().encode(self.reminders)
            try data.write(to: fileURL)
            print("Reminders saved to \(fileURL)")
            Task {
                await load()
            }
        } catch {
            print("Error saving reminders: \(error)")
            
        }
    }
    
    func load() async {
        do {
            
            let data = try Data(contentsOf: fileURL)
            let reminders = try JSONDecoder().decode([Reminder].self, from: data)
            self.reminders = reminders
        } catch {
            print("Error loading reminders: \(error)")
        }
    }
    
    //Testing previews
    
}

extension ReminderController {
    static var example: Self {
        let reminder = ReminderController()
        reminder.reminders = PreviewStore.shared
        return reminder as! Self
    }
}

final class PreviewStore {
    static let shared: [Reminder]  = [
        Reminder(title: "Reminder 1", description: "Descripcion de prueba"),
        Reminder(title: "Reminder 2", description: "Descripcion reminder 2",
                 reminderItems: [ReminderItem(description: "Item child", status: StatusItem.isDone)]),
        Reminder(title: "Reminder con fecha limite", description: "Fecha limite para reminder ejemplo",
                 reminderItems: [ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isInProgress),
                                 ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isPending, dueDate: Date().addDays(2))])
        ]
    
}

