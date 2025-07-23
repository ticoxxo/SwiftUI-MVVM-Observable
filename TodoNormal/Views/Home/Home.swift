//
//  Home.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

struct Home: View {
    @State var vm: HomeViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.reminderController.reminders.isEmpty {
                    Text("No reminders found")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Button {
                        vm.addReminder()
                    } label: {
                        Text("Add one!")
                    }
                    Button {
                        vm.addReminder()
                    } label: {
                        Text("Count in array: \(vm.reminderController.reminders.count)!")
                    }
                        
                } else{
                    List {
                        ForEach(vm.reminderController.reminders) { reminder in
                            NavigationLink(value: reminder) {
                                Text(reminder.title)
                                    .font(.headline)
                            }
                        }
                    }
                    .navigationDestination(for: Reminder.self) { rem in
                        
                        ReminderView(vm: ReminderViewModel(reminderController:  vm.reminderController), reminderId: rem.id)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.addReminder()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .opacity(vm.reminderController.reminders.isEmpty ? 0 : 1)
                }
            }
        }
    }
}

extension Home {
    init(controller: ReminderController){
        vm = HomeViewModel(reminderController: controller)
    }
}

#Preview {
    Home(controller: ReminderController())
}
