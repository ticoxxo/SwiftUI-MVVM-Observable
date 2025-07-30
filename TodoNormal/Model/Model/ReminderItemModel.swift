//
//  Restaurant.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 09/06/25.
//
import SwiftUI

@Observable
class ReminderItem: Identifiable, Hashable, Equatable {
    let id: UUID = UUID()
    var description: String
    var status: StatusItem
    var dueDate: Date?
    private(set) var creationDate: Date
    
    init(description: String, status: StatusItem, dueDate: Date? = nil, creationDate: Date = Date()) {
        self.description = description
        self.status = status
        self.dueDate = dueDate
        self.creationDate = creationDate
    }
    
    static func == (lhs: ReminderItem, rhs: ReminderItem) -> Bool {
            lhs.id == rhs.id &&
            lhs.description == rhs.description &&
            lhs.status == rhs.status &&
            lhs.dueDate == rhs.dueDate &&
            lhs.creationDate == rhs.creationDate
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(description)
            hasher.combine(status)
            hasher.combine(dueDate)
            hasher.combine(creationDate)
        }
}


