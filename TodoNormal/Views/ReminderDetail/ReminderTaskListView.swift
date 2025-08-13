//
//  ReminderTaskListView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 13/08/25.
//
import SwiftUI

struct ReminderTaskListView: View {
    var reminderTasks: [ReminderItem]
    var onItemTap: (ReminderItem) -> Void
    
    var body: some View {
        if reminderTasks.isEmpty {
            Text("No tasks available")
        } else {
            LazyVStack {
                ForEach(reminderTasks) { task in
                    Button {
                       onItemTap(task)
                    } label: {
                        HStack {
                            Spacer()
                            TextItemRow(item: task)
                            Spacer()
                            AnimateStatus(symbolo: task.status.imageText, color: task.status.color)
                            Spacer()
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
    
}
