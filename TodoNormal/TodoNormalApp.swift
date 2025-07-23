//
//  TodoNormalApp.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 03/06/25.
//

import SwiftUI

@main
struct TodoNormalApp: App {
    @State private var controller = ReminderController()
    var body: some Scene {
        WindowGroup {
            Home(controller: controller)
                
        }
    }
}
