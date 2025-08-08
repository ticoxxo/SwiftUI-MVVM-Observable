//
//  ContentView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 03/06/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(ReminderController.self) private var reminderManager
    @Environment(\.scenePhase) private var scenePhase
    @State private var addNewReminder: Bool = false
    
    var body: some View {
        NavigationStack {
            Home()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            reminderManager.setSelectedReminder(nil)
                            addNewReminder.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                        }
                    }
                }
                .navigationTitle("Todo list: \(reminderManager.reminders.count)")
        }
        .sheet(isPresented: $addNewReminder) {
            ReminderView()
        }
        .onChange(of: scenePhase) { _, phase in
            switch phase {
            case .active:
                if !reminderManager.isPreviewMode {
                    reminderManager.load()
                }
            case .background, .inactive:
                reminderManager.saveFile()
            @unknown default:
                break
            }
        }
    }
        
}

#Preview {
    ContentView()
        .environment(ReminderController(isPreviewMode: true))
}
