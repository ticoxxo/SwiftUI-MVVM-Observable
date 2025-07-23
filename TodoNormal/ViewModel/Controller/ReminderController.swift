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
    private(set) var reminders: [Reminder] = []
    
    func addOrUpdateReminder(_ reminder: Reminder) {
        if let indexReminder = reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminders[indexReminder] = reminder
        } else {
            reminders.append(reminder)
            print("Reminder count : \(reminders.count)")
        }
    }
    
    func addTask(_ item: ReminderItem, to reminder: Reminder) {
        if let exist = reminders.firstIndex ( where: {$0.id == reminder.id}) {
            reminders[exist].reminderItems.append(item)
        } else {
            print("Reminder not found")
        }
    }
    
    func getReminder(_ reminderId: UUID) throws -> Reminder? {
        guard let reminder = reminders.first(where: { $0.id == reminderId }) else {
            throw ReminderErrors.reminderNotFound
        }
        
        return reminder
    }
}
