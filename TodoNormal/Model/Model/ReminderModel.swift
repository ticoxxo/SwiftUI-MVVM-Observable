//
//  Model.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

@Observable
class Reminder: Identifiable, Hashable, Equatable {
    public  let id: UUID = UUID()
    var title: String
    var description: String
    var image: String?
    var reminderItems = [ReminderItem]()
    var status: StatusReminder
    
    init(title: String, description: String, image: String? = nil, reminderItems: [ReminderItem] = [ReminderItem](), status: StatusReminder) {
        self.title = title
        self.description = description
        self.image = image
        self.reminderItems = reminderItems
        self.status = status
    }
}

extension Reminder {
    subscript(task at: Int) -> ReminderItem? {
        guard at >= 0 && at < reminderItems.count else {
            return nil
        }
        return reminderItems[at]
    }
    
    static func == (lhs: Reminder, rhs: Reminder) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func addTaskItem(_ item: ReminderItem) {
        self.reminderItems.append(item)
    }
    
    subscript(indexById id: UUID) -> Int? {
        guard let index = reminderItems.firstIndex(where: { $0.id == id }) else {
            return nil
        }
        return index
    }
    
    subscript(copyById id: UUID) -> ReminderItem {
        get { self.reminderItems[self[indexById: id]!] }
        set { self.reminderItems[self[indexById: id]!] = newValue }
    }
    
}
