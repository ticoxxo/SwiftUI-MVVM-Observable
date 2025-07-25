//
//  FactoryKey.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI

struct FactoryKey: EnvironmentKey {
    static let defaultValue: FactoryViewModel = FactoryViewModel()
}

struct ReminderManager: EnvironmentKey {
    static let defaultValue: ReminderController = ReminderController()
}

extension EnvironmentValues {
    var factory: FactoryViewModel {
        get { self[FactoryKey.self] }
        set { self[FactoryKey.self] = newValue }
    }
    
    var reminderManager: ReminderController {
        get { self[ReminderManager.self] }
        set { self[ReminderManager.self] = newValue }
    }
}
