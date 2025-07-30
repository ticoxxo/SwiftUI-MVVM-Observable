//
//  ReminderViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI

extension ReminderView {
    @Observable
    class ViewModel {
        
        var showSheet: Bool
        var reminderID: UUID
        var reminder: Reminder
        var selectedItem: ReminderItem?
        var isEdit: Bool
        var reminderManager: ReminderController
        
        init(reminderId: UUID?, reminderManager: ReminderController, isEdit: Bool = false) {
            self.showSheet = false
            if let rem = reminderId {
                self.reminderID = rem
                self.reminder = reminderManager[copy: rem]
                self.isEdit = false
            } else {
                let newReminder = Reminder(title: "Add a title",
                                           description: "Add a description",
                                           reminderItems: [],
                                           status: .isInProgress)
                self.reminderID = newReminder.id
                self.reminder =  newReminder
                self.isEdit = true
            }
            self.reminderManager = reminderManager
        }
        
        func addTask(_ reminder: ReminderItem? = nil) {
            self.selectedItem = reminder
            self.showSheet = true
        }
        
        func saveReminder() async {
            do {
                try  await self.reminderManager.addOrUpdate(reminder: self.reminder)
            } catch {
                print("Error saving reminder: \(error)")
            }
        }
        
        func saveTask(item: ReminderItem) {
            if item.id == self.selectedItem?.id {
                self.reminder[copyById: item.id] = item
            } else {
                self.reminder.addTaskItem(item)
            }
            //self.reminder.addTaskItem(item)
        }
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
