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
            self.reminderController.reminders
        }
        var reminderController: ReminderController
        
        
        init(list: ReminderController) {
            self.reminderController = list
        }
        
    }
}





