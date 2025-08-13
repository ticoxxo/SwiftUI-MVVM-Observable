//
//  ReminderView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//

import SwiftUI

struct ReminderView: View {
    
    @Environment(ReminderController.self) var reminderManager
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: ViewModel?
    var reminder: Reminder?
    
    var body: some View {
        ScrollView(.vertical) {
            if let viewModel {
                @Bindable var viewModel = viewModel
                Section {
                    DetailText(title: "Title", text: $viewModel.reminderCopy.title)
                    DetailText(title: "Description", text: $viewModel.reminderCopy.description)
                }
                .padding()
                    
                
                Section {
                    HStack {
                        Button {
                            viewModel.saveReminder()
                            dismiss()
                        } label: {
                            Text("Add task")
                                .font(.headline)
                        }
                        .opacity(!viewModel.isEdit ? 1 : 0)
                        .disabled(!viewModel.canSave)
                        
                        
                        Button {
                            viewModel.updateReminder()
                            dismiss()
                            
                        } label: {
                            Text("Update task")
                                .font(.headline)
                                
                        }
                        .opacity(viewModel.isEdit ? 1 : 0)
                        .disabled(!viewModel.canUpdate)
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .navigationTitle(viewModel?.isEdit == true ? "Edit reminder" : "New reminder")
        .task {
            self.viewModel = ViewModel(reminderManager: reminderManager, reminder: reminder)
            //await viewModel?.loadReminder()
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
        @Previewable var reminder = ReminderController()
        let rem = Reminder.sampleDataSingle
        //reminder.selectedReminder = Reminder.sampleDataSingle
        return NavigationStack {
            ReminderView(reminder: rem)
                .environment(reminder)
        }
        
    }


/*
 
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
                         //await viewModel.saveReminder()
                         dismiss()
                     }
                 } label: {
                     Text("Save")
                     Image(systemName: "tray.full.fill")
                 }
                 Spacer()
                 Button {
                     //viewModel.addTask()
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
                                  //viewModel.addTask(item.wrappedValue)
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
             
     }
 }
 else {
     ProgressView()
         .task {
             self.viewModel = ViewModel(reminderId: self.reminderId, reminderManager: reminderManager)
         }
 }
 */
