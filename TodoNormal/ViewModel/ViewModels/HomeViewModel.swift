//
//  HomeViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

@Observable
class HomeViewModel {
    
    var reminderController: ReminderController
    
    init(reminderController: ReminderController) {
        self.reminderController = reminderController
    }
    
    func addReminder() {
        print("Entro al reminder")
        let reminder = Reminder(
            title: "Reminder Title",
            description: "This is a reminder description",
            reminderItems: [],
            status: StatusReminder.isInProgress
        )
        //todos.append(reminder)
        reminderController.addOrUpdateReminder(reminder)
    }
}




