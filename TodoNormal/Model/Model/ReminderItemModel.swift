//
//  Restaurant.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 09/06/25.
//
import SwiftUI


struct ReminderItem: Identifiable, Hashable, Equatable {
    let id: UUID = UUID()
    var description: String
    var status: StatusItem
}

