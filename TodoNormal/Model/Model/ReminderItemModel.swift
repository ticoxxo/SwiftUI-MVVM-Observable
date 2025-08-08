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
    
}

