//
//  ReminderTaskViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 24/07/25.
//
import SwiftUI

extension ReminderItemView {
    @Observable
    @MainActor
    class ViewModel {
        var reminderController: ReminderController
        
        var reminderItemCopy: ReminderItemCopy
        var reminderItem: ReminderItem?
        var reminder: Reminder
            
        var showDatePicker: Bool {
            get {
                reminderItemCopy.dueDate != nil
            }
            
            set {
                newValue ? (reminderItemCopy.dueDate = Date().addDays(1))
                : (reminderItemCopy.dueDate = nil)
            }
        }
            
        var closureDate: Date {
            
                get { self.reminderItemCopy.dueDate ?? Date()}
                set { self.reminderItemCopy.dueDate = newValue }
            
        }
        
        var canUpdate: Bool {
            reminderItemCopy.editMode
        }
       
        
        var isSave: Bool {
            !reminderItemCopy.editMode
        }
        
        init(reminderController: ReminderController,
             reminderItem: ReminderItem?,
             reminder: Reminder) {
            self.reminderController = reminderController
            guard let reminderItem = reminderItem else {
                self.reminderItemCopy = ReminderItemCopy(
                    from: ReminderItem(description: "Add a description",
                                       status: StatusItem.isInProgress))
                self.reminder = reminder
                return
            }
            self.reminderItemCopy = ReminderItemCopy(from: reminderItem, editMode: true)
            self.reminderItem = reminderItem
            self.reminder = reminder
            
        }
        
        func saveTask() {
            let newReminderTask = ReminderItem(
                description: self.reminderItemCopy.description,
                status: self.reminderItemCopy.status,
                dueDate: self.reminderItemCopy.dueDate
            )
            self.reminderController.saveNewTaskReminder(newReminderTask, to: reminder)
        }
        
        func updateTask() {
            self.reminderItem?.updateDescription(from: reminderItemCopy.description)
            self.reminderItem?.updateStatus(from: reminderItemCopy.status)
            self.reminderItem?.updateDueDate(from: reminderItemCopy.dueDate)
            self.reminderController.updateTaskReminder(reminderItem!, to: reminder)
        }
        
    }
    
    struct ReminderItemCopy: Hashable, Identifiable {
        var id: UUID = UUID()
        var description: String
        var status: StatusItem
        var dueDate: Date?
        var editMode: Bool
        
        init(from reminderItem: ReminderItem,
             editMode: Bool = false) {
            self.description = reminderItem.description
            self.status = reminderItem.status
            self.dueDate = reminderItem.dueDate
            self.editMode = editMode
        }
            
    }
}
