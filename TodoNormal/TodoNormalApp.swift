//
//  TodoNormalApp.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 03/06/25.
//

import SwiftUI

@main
struct TodoNormalApp: App {
    @State private var manager = ReminderController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(manager)
        }
    }
}
