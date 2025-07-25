//
//  ReminderTaskViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 24/07/25.
//
import SwiftUI

@Observable
class ReminderTaskViewModel {
    var reminderController: ReminderController
    
    init(reminderController: ReminderController) {
        self.reminderController = reminderController
    }
    
}
