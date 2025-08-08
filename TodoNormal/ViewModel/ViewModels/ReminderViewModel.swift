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
        var loading: Bool = true
        
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
                return reminderCopy.title != reminderManager.selectedReminder?.title ||
                reminderCopy.description != reminderManager.selectedReminder?.description
            }
        }
        
        init(reminderManager: ReminderController) {
            self.reminderManager = reminderManager
            self.reminderCopy = ReminderCopy(from: Reminder(title: "Add a title", description: "Add a descripción"))
        }
        
        func loadReminder() async {
            guard let reminder = reminderManager.selectedReminder else {
                let emptyReminder = Reminder(title: "Add a title", description: "Add a descripción")
                self.reminderCopy = ReminderCopy(from: emptyReminder)
                loading = false
                return
            }
            
            
            self.reminderCopy = ReminderCopy(from: reminder, editMode: true)
            loading = false
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
