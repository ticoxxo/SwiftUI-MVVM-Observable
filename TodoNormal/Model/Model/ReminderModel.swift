//
//  Model.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI


struct Reminder: Identifiable, Codable, Hashable{
    let id: UUID = UUID()
    var title: String
    var description: String
    var image: String?
    var reminderItems = [ReminderItem]()
    var creationDate: Date = Date()
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case description
        case image
        case reminderItems
        case creationDate
    }
}


extension Reminder {
    
    mutating func updateTitle(_ title: String) {
        self.title = title
    }
    
    mutating func updateDescription(_ description: String) {
        self.description = description
    }
    
    static var sampleDataSingle: Self {
        Reminder(title: "Reminder de prueba", description: "Descripcion de prueba")
    }
    
    static var sampleDataWithItems: Self {
        Reminder(title: "Reminder con fecha limite", description: "Fecha limite para reminder ejemplo",
                 reminderItems: [ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isInProgress),
                                 ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isPending, dueDate: Date().addDays(2))])
    }
}
