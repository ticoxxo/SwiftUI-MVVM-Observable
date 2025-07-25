//
//  ReminderErrors.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI

enum ReminderErrors: Error {
    case reminderElementNotFound
    case reminderAlreadyExists
    case reminderIdNotFound
    case reminderIsNil
}


enum ReminderItemErrors: Error {
    case itemIsNil
}
