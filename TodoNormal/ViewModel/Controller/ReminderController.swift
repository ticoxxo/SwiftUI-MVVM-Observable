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
    var reminders = [Reminder]()
    
    var selectedReminder: Reminder?
    var selectedReminderItem: ReminderItem?
    
    var isPreviewMode: Bool = false
    
    init() {}
    
    init(isPreviewMode: Bool) {
        if isPreviewMode {
            loadPreviewData()
        }
        self.isPreviewMode = isPreviewMode
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
    }
    
    func fileUrl() -> URL {
        let directory = URL.documentsDirectory
        return directory.appendingPathComponent("remindersList.json")
    }
    
    func saveFile() {
        do {
            let data = try JSONEncoder().encode(self.reminders)
            let url = fileUrl()
            try data.write(to: url)
            print("Reminders saved to \(url)")
        } catch {
            print("Error saving reminders: \(error)")
            
        }
    }
    
    func load() {
        do {
            let url = fileUrl()
            let data = try Data(contentsOf: url)
            let reminders = try JSONDecoder().decode([Reminder].self, from: data)
            self.reminders = reminders
        } catch {
            print("Error loading reminders: \(error)")
            self.reminders = []
        }
    }
    
    //Testing previews
    
    func loadPreviewData() {
        self.reminders = PreviewStore.shared
    }
    
}

final class PreviewStore {
    static let shared: [Reminder]  = [
        Reminder(title: "Reminder de prueba", description: "Descripcion de prueba"),
        Reminder(title: "Reminder dos", description: "Descripcion reminder 2",
                 reminderItems: [ReminderItem(description: "Item child", status: StatusItem.isDone)]),
        Reminder(title: "Reminder con fecha limite", description: "Fecha limite para reminder ejemplo",
                 reminderItems: [ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isInProgress),
                                 ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isPending, dueDate: Date().addDays(2))])
        ]
    
}

