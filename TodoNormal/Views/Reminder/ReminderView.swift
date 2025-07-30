//
//  ReminderView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//

import SwiftUI

struct ReminderView: View {
    
    @Environment(\.reminderManager) private var reminderManager
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: ViewModel?
    var reminderId: Reminder.ID?
    var body: some View {
        
        
        if let viewModel {
            @Bindable var viewModel = viewModel
            VStack {
                
                VStack {
                    Text("ID = \(viewModel.reminder.id)")
                        .font(.caption)
                        
                    TextField("|1|  qq", text: $viewModel.reminder.title)
                    HStack {
                        Button {
                            Task {
                                await viewModel.saveReminder()
                                dismiss()
                            }
                        } label: {
                            Text("Save")
                            Image(systemName: "tray.full.fill")
                        }
                        Spacer()
                        Button {
                            viewModel.addTask()
                        } label: {
                            Text("Add task")
                            Image(systemName: "plus")
                        }
                        
                        
                    }
                    .opacity(viewModel.isEdit ? 1 : 0)
                }
                .padding()
                        
                    List {
                         ForEach($viewModel.reminder.reminderItems) { item in
                         
                             HStack {
                                 TextItemRow(item: item.wrappedValue)
                                     .onTapGesture {
                                         viewModel.addTask(item.wrappedValue)
                                     }
                                 Spacer()
                                 PickerView(item: item)
                             }
                             .listItemStyle(item.status.wrappedValue.color)
                         }
                    }
    
            }
            .navigationTitle("Lista de tareas")
            .sheet(isPresented: $viewModel.showSheet) {
                SheetTaskView(reminderItem: viewModel.selectedItem, onSave: { item in
                    viewModel.saveTask(item: item)
                })
                    
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.addTask()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        else {
            ProgressView()
                .task {
                    self.viewModel = ViewModel(reminderId: self.reminderId, reminderManager: reminderManager)
                }
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
        
        let reminder = ReminderController.defaultList[2]
        NavigationStack {
            ReminderView(reminderId: reminder.id)
                .environment(\.reminderManager, ReminderController())
        }
        
    }
