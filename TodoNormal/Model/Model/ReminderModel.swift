//
//  Model.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

struct Reminder: Identifiable, Hashable {
    public  let id: UUID = UUID()
    var title: String
    var description: String
    var image: String?
    var reminderItems = [ReminderItem]()
    var status: StatusReminder
}

extension Reminder {
    subscript(task at: Int) -> ReminderItem? {
        guard at >= 0 && at < reminderItems.count else {
            return nil
        }
        return reminderItems[at]
    }
    
}
