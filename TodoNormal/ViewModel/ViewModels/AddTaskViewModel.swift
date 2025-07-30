//
//  AddTaskViewModel.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 25/07/25.
//
import SwiftUI


extension SheetTaskView {
    @Observable
    class AddTaskViewModel {
        
        var reminderItem: ReminderItem
        var showDateSection: Bool {
            get {
                self.reminderItem.dueDate != nil
            }
            
            set {
                newValue ? (self.reminderItem.dueDate = Date().addDays(1)) : (self.reminderItem.dueDate = nil)
            }
        }
        var closureDate: Binding<Date> {
            Binding(
                get: { self.reminderItem.dueDate ?? Date()},
                set: { self.reminderItem.dueDate = $0 }
            )
        }
        
        var isFormValid: Bool {
            !self.reminderItem.description.isEmpty &&
            self.isDateValid
        }
        
        var isDateValid: Bool {
            guard let dueDate = self.reminderItem.dueDate else {
                return true
            }
            
            return dueDate > Date()
        }
        
        var dismiss: (() -> Void)?
        
        var onSave: ((ReminderItem) -> Void)?
        
        init(reminderItem: ReminderItem?, onSave: @escaping (ReminderItem) -> Void) {
            if let item = reminderItem {
                self.reminderItem = item
            } else {
                self.reminderItem = ReminderItem(
                    description: "",
                    status: StatusItem.isPending
                )
            }
            self.onSave = onSave
        }
        
        func save() async {
            onSave?(self.reminderItem)
        }
        
    }
    
}


