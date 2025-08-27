//
//  Home.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI
import CoreData

struct Home: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    @Environment(\.managedObjectContext) var context
    
    init() {
        _viewModel = ObservedObject(wrappedValue: ViewModel())
    }
    
    var body: some View {
        VStack {
            List(viewModel.reminders) { reminder in
                ReminderRowText(title: reminder.title, description: reminder.descriptor)
                Text("Si")
            }
        }
        .task {
            viewModel.setContext(context: context)
            viewModel.fetchReminders()
        }
    }
}

#Preview {
    @Previewable @State  var context = PersistentContainer.preview.container.viewContext
    NavigationStack {
        Home()
            .environment(\.managedObjectContext, context)
    }
}


/*
 List {
     ForEach(vm.reminderController.reminders) { reminder in
         NavigationLink(value: reminder) {
             Text(reminder.title)
                 .font(.headline)
         }
     }
 }
 .navigationDestination(for: Reminder.self) { rem in
     
     ReminderView(vm: factory.makeReminderViewModel(), reminderId: rem.id)
 }
 */
