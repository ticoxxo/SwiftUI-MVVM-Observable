//
//  ReminderController.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI
import Observation

@Observable
class ReminderController {
    var reminders: [Reminder] = []
    static let defaultList: [Reminder] = [
        Reminder(title: "Reminder de prueba", description: "Descripcion de prueba", status: StatusReminder.isInProgress),
        Reminder(title: "Reminder dos", description: "Descripcion reminder 2",
                 reminderItems: [ReminderItem(description: "Item child", status: StatusItem.isDone)],
                 status: StatusReminder.isPending ),
        Reminder(title: "Reminder con fecha limite", description: "Fecha limite para reminder ejemplo",
                 reminderItems: [ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isInProgress),
                                 ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isPending, dueDate: Date().addDays(2))],
                 status: StatusReminder.isPending)
    ]
  
    init() {
        self.reminders = ReminderController.defaultList
    }
}

extension ReminderController {

    func getAll() -> [Reminder] {
        return reminders
    }
    
    func addOrUpdate(reminder: Reminder?) throws {
        guard let validReminder = reminder else {
            throw ReminderErrors.reminderIsNil
        }
        
        if let exist = self[index: validReminder.id] {
            reminders[exist] = validReminder
        } else {
            reminders.append(validReminder)
        }
    }
    
    func addTask(task: ReminderItem? , to id: UUID) throws {
        guard let valid = task else {
            throw ReminderItemErrors.itemIsNil
        }
        if let index = self[index: id] {
            reminders[index].reminderItems.append(valid)
        } else {
            throw ReminderErrors.reminderElementNotFound
        }
    }
    
    subscript(at position: Int) -> Reminder? {
        guard position >= 0 && position < reminders.count else {
            return nil
        }
        return reminders[position]
    }
    
    subscript(index id: UUID) -> Int? {
        guard let index = reminders.firstIndex(where : { $0.id == id }) else {
            return nil
        }
        
        return index
    }
    
    subscript(copy id: UUID) -> Reminder {
        get { self.reminders[self[index: id]!] }
        set { self.reminders[self[index: id]!] = newValue }
    }
    
    subscript(binding id: UUID)  -> Binding<Reminder>? {
        guard let index = self[index: id] else {
            return nil
        }
        return Binding(
            get: { self.reminders[index] },
            set: { self.reminders[index] = $0 }
        )
    }
    
    subscript(all: String) -> Binding<[Reminder]>{
        return Binding<[Reminder]>(
            get: { self.reminders },
            set: { self.reminders = $0 }
            )
    }
    
    func getBindArray() -> Binding<[Reminder]> {
        return Binding<[Reminder]>(
            get: { self.reminders },
            set: { self.reminders = $0 }
            )
    }
    
}
