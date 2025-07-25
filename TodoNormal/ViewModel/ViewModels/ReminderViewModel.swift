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
        
        init(){
            self.showSheet = false
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
