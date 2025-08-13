//
//  Restaurant.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 09/06/25.
//
import SwiftUI

struct ReminderItem: Identifiable, Codable, Hashable {
    let id: UUID = UUID()
    var description: String
    var status: StatusItem
    var dueDate: Date?
    private(set) var creationDate: Date = Date()
    
    enum CodingKeys: CodingKey {
        case id
        case description
        case status
        case dueDate
        case creationDate
    }
    
    mutating func updateDescription(from: String) {
        self.description = from
    }
    
    mutating func updateStatus(from: StatusItem) {
        self.status = from
    }
    
    mutating func updateDueDate(from: Date?) {
        self.dueDate = from
    }
    
}

