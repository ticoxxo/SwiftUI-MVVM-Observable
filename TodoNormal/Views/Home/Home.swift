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
    @State var ddd = [Reminder]()
    var body: some View {
        NavigationStack {
            if let viewModel {
                List {
                    ForEach(viewModel.reminders) { reminder in
                        NavigationLink(value: reminder.id) {
                            Text(reminder.title)
                                .font(.headline)
                        }
                    }
                }
                .navigationDestination(for: Reminder.ID.self) { id in
                    ReminderView(reminderId:  id)
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
