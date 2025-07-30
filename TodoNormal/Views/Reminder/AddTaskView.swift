//
//  AddTaskView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 25/07/25.
//

import SwiftUI

struct SheetTaskView: View {
    //@Bindable var reminder: Reminder
    var reminderItem: ReminderItem?
    var onSave: ((ReminderItem) -> Void)?
    @State private var viewModel: AddTaskViewModel?
    @Environment(\.dismiss) private var dismiss
 
    var body: some View {
        Form {
            
            if let viewModel {
                @Bindable var viewModel = viewModel
                Section(header: Text("Detail")) {
                    TextField("Task Title", text: $viewModel.reminderItem.description)
                        .validateFormSection(viewModel.isFormValid)
                }
                
                Section {
                    if viewModel.showDateSection {
                        //DatePicker("Due date", selection: $viewModel.reminderItem.dueDate)
                        //.labelsHidden()
                        DatePicker("", selection: viewModel.closureDate,in: Date()...Date().addYears(20))
                            .labelsHidden()
                    }
                } header: {
                    Toggle("Wanna add a due date?", isOn: $viewModel.showDateSection)
                } footer: {
                    Text("Fecha \(viewModel.reminderItem.dueDate?.toString(format: .mediumDate) ?? "No tiene!!")")
                }
                
                Section {
                    HStack {
                        Text("Status of task")
                        Spacer()
                        PickerView(item: $viewModel.reminderItem)
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button {
                            Task {
                                await viewModel.save()
                                dismiss()
                            }
                        } label: {
                            Text("Guardar")
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        }
                        .disabled(!viewModel.isFormValid)
                        .opacity(viewModel.isEdit ? 0 : 1)
                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            Text("Cerrar")
                            Image(systemName: "eraser.fill")
                                .tint(.red)
                        }
                        Spacer()
                    }
                    
                } header: {
                    Label {
                        Text("Actions")
                    } icon: {
                        Image(systemName: "desktopcomputer")
                    }
                }
                
            }
        }
        .task {
            self.viewModel = AddTaskViewModel(reminderItem: self.reminderItem, onSave: onSave ?? { _ in })
        }
    }
}


#Preview {
    let obj = ReminderController.defaultList[2].reminderItems[0]
    SheetTaskView(reminderItem: obj)
}

 
