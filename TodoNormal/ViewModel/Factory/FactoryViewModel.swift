//
//  FactoryViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI

@Observable
class FactoryViewModel {
    let reminderController = ReminderController()
    
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(reminderController: ReminderController())
    }
    
    func makeReminderViewModel(reminder: Reminder) -> ReminderViewModel {
        return ReminderViewModel( reminderController: reminderController)
    }
}
