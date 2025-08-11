//
//  ContentView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 03/06/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(ReminderController.self) private var reminderManager
    @State private var addNewReminder: Bool = false
    
    var body: some View {
        NavigationStack {
            Home()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            addNewReminder.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                        }
                        .accessibilityIdentifier("addNewReminderButton")
                    }
                }
                .navigationTitle("Todo list: \(reminderManager.reminders.count)")
        }
        .sheet(isPresented: $addNewReminder) {
            ReminderView()
                .environment(reminderManager)
        }
    }
        
}

#Preview {
    ContentView()
        .environment(ReminderController())
}
