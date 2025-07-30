//
//  ReminderView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//

import SwiftUI

struct ReminderView: View {
    
    @Environment(\.reminderManager) private var reminderManager
    @State private var viewModel: ViewModel?
    var reminderId: Reminder.ID
    var body: some View {
        
        
        if let viewModel {
            @Bindable var viewModel = viewModel
            VStack {
                Text(viewModel.reminder.title )
                TextField("Title", text: $viewModel.reminder.title)
                        
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
                /*
                 if let selectedItem = viewModel.selectedItem {
                 SheetTaskView(reminder: $reminder, selectedItem: selectedItem)
                 } else {
                 SheetTaskView(reminder: $reminder)
                 }
                 */
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
                    self.viewModel = ViewModel(reminderId: reminderId, reminderManager: reminderManager)
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
