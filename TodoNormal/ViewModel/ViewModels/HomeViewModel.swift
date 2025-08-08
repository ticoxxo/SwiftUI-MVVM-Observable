//
//  HomeViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

extension Home {
    @Observable
    @MainActor
    class ViewModel {
        
        
        var reminders: [Reminder] {
            reminderController.reminders
        }
        
        var selectedReminder: Reminder? {
            reminderController.selectedReminder
        }
            
        
        var reminderController: ReminderController
        init(reminderManager: ReminderController) {
            self.reminderController = reminderManager
        }
        
        func selectReminder(set selectedReminder: Reminder?) {
            if let selectedReminder = selectedReminder {
                self.reminderController.setSelectedReminder(selectedReminder)
            }
            
            self.reminderController.setSelectedReminder(nil)
        }
  
    }
}





