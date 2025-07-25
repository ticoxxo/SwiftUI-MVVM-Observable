//
//  HomeViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

extension Home {
    @Observable
    class ViewModel {
        var reminderManager: ReminderController
        
        
        init(reminderManager: ReminderController) {
            self.reminderManager = reminderManager
        }
  
    }
}





