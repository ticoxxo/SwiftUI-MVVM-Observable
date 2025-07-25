//
//  Home.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

struct Home: View {
    @State private var viewModel: ViewModel?
    @Environment(\.reminderManager) private var reminderManager
    
    var body: some View {
        NavigationStack {
            if let viewModel {
                List {
                    
                    ForEach(viewModel.reminderManager.reminders) { reminder in
                        NavigationLink(value: reminder.id) {
                            Text(reminder.title)
                                .font(.headline)
                        }
                    }
                }
                .navigationDestination(for: Reminder.ID.self) { id in
                    if let bind = viewModel.reminderManager[binding: id] {
                        ReminderView(reminder:  bind)
                    }
                }
            }
        }
        .task {
            self.viewModel = ViewModel(reminderManager: reminderManager)
        }
    }
}

#Preview {
    Home()
        .environment(\.reminderManager, ReminderController())
}


/*
 List {
     ForEach(vm.reminderController.reminders) { reminder in
         NavigationLink(value: reminder) {
             Text(reminder.title)
                 .font(.headline)
         }
     }
 }
 .navigationDestination(for: Reminder.self) { rem in
     
     ReminderView(vm: factory.makeReminderViewModel(), reminderId: rem.id)
 }
 */
