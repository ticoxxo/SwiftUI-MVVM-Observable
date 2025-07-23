//
//  ReminderViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI

@Observable
class ReminderViewModel {
    
    var reminderController: ReminderController
    
    init(reminderController: ReminderController){
        self.reminderController = reminderController
    }
    
    func addTask(to reminder: Reminder) {
        let item = ReminderItem(
            description: "This is a new task description",
            status: StatusItem.isInProgress
        ) // Borrar es solo test
        reminderController.addTask(item  ,to: reminder)
    }
}
