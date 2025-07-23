//
//  ReminderView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//

import SwiftUI

struct ReminderView: View {
    
    @State var vm: ReminderViewModel
    var reminderId: UUID
    var body: some View {
        if let reminder = try! vm.reminderController.getReminder(reminderId){
            VStack {
                List {
                    ForEach(reminder.reminderItems) { item in
                        Text(item.description)
                    }
                }
            }
            .navigationTitle(reminder.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.addTask(to: reminder)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        } else {
            Text("Reminder not found")
                .padding()
        }
    }
}

#Preview {
    @Previewable @State var reminder = Reminder(
        title: "My reminder",
        description: "My reminder description",
        image: nil,
        status: StatusReminder.isInProgress
    )
    NavigationStack {
        ReminderView(
            vm: ReminderViewModel(
                reminderController: ReminderController()
            ),
            reminderId: reminder.id
        )
    }
    
}

