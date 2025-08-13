//
//  ReminderItemView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 24/07/25.
//

import SwiftUI

struct ReminderItemView: View {
    @State private var vm: ViewModel?
    @Environment(ReminderController.self) var reminderManager
    @Environment(\.dismiss) private var dismiss
    var reminderItem: ReminderItem?
    var reminder: Reminder

    var body: some View {
        Form {
            if let vm {
                @Bindable var vm = vm
                
                Section {
                    DetailText(title: "Description", text: $vm.reminderItemCopy.description)
                }
                .padding()
                
                Section {
                    if vm.reminderItemCopy.dueDate != nil {
                        
                        DatePicker("", selection: $vm.closureDate,
                                   in: Date()...Date().addYears(20))
                            .labelsHidden()
                    }
                } header: {
                    HStack {
                        Text("Due date")
                            .font(.headline)
                            .bold()
                        Spacer()
                        Toggle("", isOn: $vm.showDatePicker)
                    }
                } footer: {
                    Text("Expires on: \(vm.reminderItemCopy.dueDate?.toString(format: .mediumDate) ?? "No date")")
                }
                
                Section {
                    HStack {
                        HStack {
                            Text("Status of task")
                            Image(systemName: vm.reminderItemCopy.status.imageText)
                                
                        }
                        Spacer()
                        PickerView(
                            item: $vm.reminderItemCopy.status,
                            options: StatusItem.allCases,
                            label: { $0.statusText }
                        )
                    }
                }
                
                Section {
                    HStack {
                        Button {
                            vm.saveTask()
                            dismiss()
                        } label: {
                            Text("Save")
                                .font(.headline)
                        }
                        .disabled(!vm.isSave)
                        .opacity(vm.isSave ? 1 : 0)
                        Button {
                            vm.updateTask()
                            dismiss()
                        } label: {
                            Text("Update")
                                .font(.headline)
                        }
                        .disabled(!vm.canUpdate)
                        .opacity(vm.canUpdate ? 1 : 0)
                        
                        Button {
                            
                        } label: {
                            Text("Cancel")
                                .font(.headline)
                        }
                       
                    }
                }
            }
        }
        .task {
            vm = ViewModel(reminderController: reminderManager, reminderItem: reminderItem, reminder: reminder)
        }
    }
}

#Preview {
    @Previewable @State var manager = ReminderController(isMock: true)
    //let reminder = manager.reminders.first!
    let reminder = manager.reminders[2]
    //let reminderItem = reminder.reminderItems.first
    //let reminderItem = manager.reminders[2].reminderItems[1]
    let reminderItem = reminder.reminderItems[0]
    ReminderItemView(reminderItem: reminderItem, reminder: reminder)
        .environment(manager)
}
