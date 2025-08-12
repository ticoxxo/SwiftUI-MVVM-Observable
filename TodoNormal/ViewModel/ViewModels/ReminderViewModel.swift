//
//  ReminderViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI

extension ReminderView {
    @Observable
    @MainActor
    class ViewModel {
        /*
         get {
                 // Conditional logic for getting
                 if reminderManager.selectedReminder?.title.isEmpty == true {
                     return nil
                 }
                 return reminderManager.selectedReminder
             }
             set {
                 // Conditional logic for setting
                 if let newValue = newValue, !newValue.title.isEmpty {
                     reminderManager.selectedReminder = newValue
                 } else {
                     reminderManager.selectedReminder = nil
                 }
             }
         */
        var reminderManager: ReminderController
        var showSheet: Bool = false
        var reminderCopy: ReminderCopy
        var reminder: Reminder?
        
        var isEdit: Bool {
            reminderCopy.editMode
        }
        var canSave: Bool {
            if isEdit {
                return false
            } else {
                return !reminderCopy.title.isEmpty &&
                !reminderCopy.description.isEmpty
            }
        }
        
        var canUpdate: Bool {
            if !isEdit {
                return false
            } else {
                return reminderCopy.title != reminder?.title ||
                reminderCopy.description != reminder?.description
            }
        }
        
        init(reminderManager: ReminderController, reminder: Reminder?) {
            self.reminderManager = reminderManager
            guard let reminder = reminder else {
                self.reminderCopy = ReminderCopy(from: Reminder(title: "Add a title", description: "Add a descripción"))
                return
            }
            self.reminderCopy = ReminderCopy(from: reminder, editMode: true)
            self.reminder = reminder
        }
        
        func saveReminder() {
            let newReminder = Reminder(
                title: reminderCopy.title,
                description: reminderCopy.description
            )
            self.reminderManager.saveNewReminder(newReminder)
        }
        
        func updateReminder() {
            self.reminder?.updateTitle(reminderCopy.title)
            self.reminder?.updateDescription(reminderCopy.description)
            
            self.reminderManager.updateReminder(self.reminder!)
        }
    
    }
}


struct ReminderCopy {
    var title: String
    var description: String
    var editMode: Bool
   
    init(from reminder: Reminder, editMode: Bool = false) {
        self.title = reminder.title
        self.description = reminder.description
        self.editMode = editMode
    }
}

/*
@Observable
class ReminderViewModel {
    
    var reminder: Binding<Reminder>?
    
    init(id: UUID, reminderController: ReminderController){
        self.reminder = reminderController[binding: id]
    }
   
    func addTask(to id: UUID) {
        let item = ReminderItem(
            description: "This is a new task description",
            status: StatusItem.isInProgress
        ) // Borrar es solo test
        
        do {
            try reminders.addTask(task: item, to: id)
        } catch ReminderItemErrors.itemIsNil{
            print("Item is nil, cannot add")
        } catch ReminderErrors.reminderElementNotFound {
            print("Reminder element not found, cannot add item")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    func getReminderInfo(by id: UUID)  -> Reminder? {
        if let reminder = reminders[reminderCopy: id] {
            return reminder
        } else {
            return nil
        }
    }
    
    func getBinding(by id: UUID) -> Binding<Reminder>? {
        if let bind = reminders[binding: id] {
            return bind
        } else {
            return nil
        }
    }
     
}
     */
