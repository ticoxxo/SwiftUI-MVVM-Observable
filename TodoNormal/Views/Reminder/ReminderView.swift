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
    
    var body: some View {
        ScrollView(.vertical) {
            if let viewModel {
                @Bindable var viewModel = viewModel
                if viewModel.loading {
                    ProgressView()
                } else {
                    Section {
                        DetailText(title: "Title", text: $viewModel.reminderCopy.title)
                        DetailText(title: "Description", text: $viewModel.reminderCopy.description)
                    }
                    .padding()
                        
                    
                    Section {
                        HStack {
                            Button {
                                
                            } label: {
                                Text("Add task")
                                    .font(.headline)
                            }
                            .opacity(!viewModel.isEdit ? 1 : 0)
                            .disabled(!viewModel.canSave)
                            
                            
                            Button {
                                
                            } label: {
                                Text("Update task")
                                    .font(.headline)
                                    
                            }
                            .opacity(viewModel.isEdit ? 1 : 0)
                            .disabled(!viewModel.canUpdate)
                            
                            Button {
                                
                            } label: {
                                Text("Cancel")
                                    .font(.headline)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(viewModel?.isEdit == true ? "Edit reminder" : "New reminder")
        .task {
            self.viewModel = ViewModel(reminderManager: reminderManager)
            await viewModel?.loadReminder()
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
        @Previewable var reminder = ReminderController(isPreviewMode: true)
        //reminder.selectedReminder = Reminder.sampleDataSingle
        return NavigationStack {
            ReminderView()
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
