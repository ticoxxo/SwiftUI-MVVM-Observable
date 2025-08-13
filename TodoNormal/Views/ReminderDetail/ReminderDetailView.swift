//
//  ReminderDetailView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 12/08/25.
//

import SwiftUI

struct ReminderDetailView: View {
    @Environment(ReminderController.self) var reminderManager
    @State private var viewModel: ReminderDetailViewModel?
    var reminder: Reminder
    
    /*
     init(reminder: Reminder) {
        let viewModel = ReminderDetailViewModel(reminder: reminder)
        _viewModel = State(initialValue: viewModel)
    }
     */
    
    var body: some View {
        ScrollView {
            if let viewModel {
                @Bindable var viewModel = viewModel
                VStack {
                    Section {
                        Text(viewModel.reminder.title)
                            .font(.title)
                            .bold()
                            .padding(.top, 8)
                        Text(viewModel.reminder.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(nil)
                            
                    } header: {
                        HStack {
                            Text("Detail")
                                .font(.title)
                                .bold()
                                .padding(.top, 8)
                            Spacer()
                            Button {
                                viewModel.showEdit.toggle()
                            } label: {
                                Image(systemName: "pencil")
                                    .foregroundStyle(.secondary)
                                    .font(.title2)
                            }
                        }
                        .padding()
                    }
                    
                    Section {
                        ReminderTaskListView(reminderTasks: viewModel.reminder.reminderItems, onItemTap: { item in
                            viewModel.reminderItem = item
                            viewModel.showTaskEdit.toggle()
                        }
                        )
                    } header: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Tasks")
                                    .font(.title)
                                    .bold()
                                    .padding(.top, 8)
                                Text("Click on a item to edit or delete it.")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Button {
                                viewModel.reminderItem = nil
                                viewModel.showTaskEdit.toggle()
                            } label: {
                                Image(systemName: "cross.fill")
                                    .foregroundStyle(.secondary)
                                    .font(.title2)
                            }
                        }
                        .padding()
                    }
                }
                .sheet(isPresented: $viewModel.showSheet) {
                    
                     if viewModel.showEdit {
                        
                         ReminderView(reminder: viewModel.reminder)
                            .environment(reminderManager)
                    } else  {
                        if let item = viewModel.reminderItem {
                            ReminderItemView(reminderItem: item,reminder: viewModel.reminder)
                               .environment(reminderManager)
                        } else {
                            ReminderItemView(reminder: viewModel.reminder)
                               .environment(reminderManager)
                        }
                         
                    }
                    
                }
            }
        }
        .task {
            self.viewModel = ReminderDetailViewModel(reminder: reminder, reminderManager: reminderManager)
        }
    }
}

#Preview {
   
    let reminder: ReminderController = ReminderController(isMock: true)
    let f = reminder.reminders[1]
    ReminderDetailView(reminder: f)
        .environment(reminder)
}





