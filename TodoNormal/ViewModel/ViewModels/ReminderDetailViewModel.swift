//
//  ReminderDetailViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 13/08/25.
//

import SwiftUI

extension ReminderDetailView {
    @Observable
    @MainActor
    class ReminderDetailViewModel {
        var reminderManager: ReminderController
        
        var reminder: Reminder {
            self.reminderManager[withId: ccc] ?? Reminder(title: "No title", description: "No description")
        }
        var showEdit: Bool = false
        var showTaskEdit: Bool = false
        var showSheet: Bool {
            get { showEdit || showTaskEdit }
            set {
                if showEdit {
                    showEdit = newValue
                } else if showTaskEdit {
                    showTaskEdit = newValue
                }
            }
        }
        
        var reminderItem: ReminderItem?
        
        var ccc: UUID
        
        init(reminder: Reminder, reminderManager: ReminderController) {
            self.reminderManager = reminderManager
            self.ccc = reminder.id
        }
        
        
    }
}
