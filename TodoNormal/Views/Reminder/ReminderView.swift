//
//  ReminderView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//

import SwiftUI

struct ReminderView: View {
    
    @State private var viewModel = ViewModel()
    @Binding var reminder: Reminder
    var body: some View {
        VStack {
            List {
                ForEach($reminder.reminderItems) { item in
                    HStack {
                        TextItemRow(item: item.wrappedValue)
                        Spacer()
                        PickerView(item: item)
                    }
                    .listItemStyle(item.status.wrappedValue.color)
                }
            }
        }
        .navigationTitle("Lista de tareas")
        .task {
            //self.viewModel = ViewModel(reminderManager: reminderManager)
        }
    }
}

struct TestBind: View {
    @Binding var reminder: Reminder
    var body: some View {
        VStack {
            Text("Inside test")
            TextField("Inside test", text: $reminder.title)
        }
        
    }
}


struct PickerView: View {
    @Binding var item: ReminderItem

    var body: some View {
        VStack {
            AnimateStatus(symbolo: item.status.imageText, color: item.status.color)
            Picker("",selection: $item.status) {
                ForEach(StatusItem.allCases) { status in
                    Text(status.statusText)
                }
            }
            .labelsHidden()
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.25)
    }
}

/*
 
 ForEach(StatusItem.allCases) { status in
     HStack {
         AnimateStatus(symbolo: status.imageText, color: status.color)
         Text("\(status.statusText)")
     }
     .tag(status)
 }
 */

#Preview {
    
    
    @Previewable @State var reminder = Reminder(title: "Reminder con fecha limite", description: "Fecha limite para reminder ejemplo",
                                                reminderItems: [ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isInProgress),
                                                                ReminderItem(description: "Darle de comer a los gatos", status: StatusItem.isPending, dueDate: Date().addDays(2))],
                                                status: StatusReminder.isPending)
    NavigationStack {
        ReminderView(reminder: $reminder)
    }
    
}
