//
//  StatusEnums.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

enum StatusReminder: Hashable {
    case isDone
    case isCancelled
    case isPaused
    case isInProgress
    case isArchived
    case isPending
    
    var color: Color {
        switch self {
        case .isDone: return .green
        case .isCancelled: return .red
        case .isPaused: return .yellow
        case .isInProgress: return .blue
        case .isArchived: return .gray
        case .isPending: return .orange
        }
    }
    
    var imageText: String {
        switch self {
        case .isDone: return "checkmark.seal"
        case .isCancelled: return "xmark.seal"
        case .isPaused: return "pause.circle.fill"
        case .isInProgress: return "progress.indicator"
        case .isArchived: return "archivebox.fill"
        case .isPending: return "tortoise.circle"
        }
    }
}

enum StatusItem: Hashable {
    case isDone
    case isCancelled
    case isPaused
    case isInProgress
    case isArchived
    case isPending
    
    var color: Color {
        switch self {
        case .isDone: return .green
        case .isCancelled: return .red
        case .isPaused: return .yellow
        case .isInProgress: return .blue
        case .isArchived: return .gray
        case .isPending: return .orange
        }
    }
    
}
