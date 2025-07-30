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
            self.isDateValid &&
            !self.areEqual
        }
        
        var isDateValid: Bool {
            guard let dueDate = self.reminderItem.dueDate else {
                return true
            }
            
            return dueDate > Date()
        }
        
        var areEqual: Bool  {
            guard let clone = self.reminderClone else {
                return false
            }
            
            let isIt = self.reminderItem.description == clone.description &&
            self.reminderItem.status.imageText == clone.status.imageText &&
            self.reminderItem.dueDate == clone.dueDate
                
            
            return isIt
            
        }
        
        var dismiss: (() -> Void)?
        
        var onSave: ((ReminderItem) -> Void)?
        
        var reminderClone: CloneReminder?
        
        var isEdit: Bool
        
        init(reminderItem: ReminderItem?, onSave: @escaping (ReminderItem) -> Void) {
            if let item = reminderItem {
                self.reminderItem = item
                self.reminderClone = .init(item: item)
                self.isEdit = true
            } else {
                self.reminderItem = ReminderItem(
                    description: "Agrega un titulo",
                    status: StatusItem.isPending
                )
                self.reminderClone = nil
                self.isEdit = false
            }
            self.onSave = onSave
        }
        
        func save() async {
            onSave?(self.reminderItem)
        }
        
    }
    
    struct CloneReminder {
        var description: String
        var status: StatusItem
        var dueDate: Date?
        
        init(item: ReminderItem) {
            self.description = item.description
            self.status = item.status
            self.dueDate = item.dueDate
        }

    }
    
}


