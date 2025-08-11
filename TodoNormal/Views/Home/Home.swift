//
//  Home.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

struct Home: View {
    @State private var vm: ViewModel?
    @Environment(ReminderController.self) var reminderManager
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack {
            if let vm {
                Text("Reminder count: \(vm.reminders.count)")
                ReminderList(list: vm.reminders)
            }
        }
        .navigationDestination(for: Reminder.self) { reminder in
            //reminderManager.setSelectedReminder(reminder)
            ReminderView(reminder: reminder)
                .environment(reminderManager)
        }
        
        .task {
            vm = ViewModel(list: reminderManager)
        }
    }
}

#Preview {
    NavigationStack {
        Home()
            .environment(ReminderController())
    }
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
