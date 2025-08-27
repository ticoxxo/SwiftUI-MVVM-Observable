//
//  StatusEnums.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

enum StatusItem: Int16, Hashable, CaseIterable, Identifiable, Codable {
    case isInProgress = 0
    case isCancelled = 1
    case isPaused = 2
    case isDone = 3
    case isArchived = 4
    case isPending = 5
    
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
    
    var statusText: String {
        switch self {
        case .isDone: return "Done"
        case .isCancelled: return "Cancelled"
        case .isPaused: return "Paused"
        case .isInProgress: return "Progress"
        case .isArchived: return "Archived"
        case .isPending: return "Pending"
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
    
    var id: StatusItem { self }
    
}
