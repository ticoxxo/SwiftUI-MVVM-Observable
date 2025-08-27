//
//  TestCore.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 15/08/25.
//

import SwiftUI
import CoreData

struct TestCore: View {
    
    @ObservedObject var reminder: CDReminder
    
    /*
    init(reminder: CDReminder,
         selectedTask: Binding<CDReminder?>) {
        self.reminder = reminder
        self._selectedTask = selectedTask
    }*/
    
    var body: some View {
        VStack {
            DetailText(title: "Task", text: $reminder.title)
            
        }
        
    }
}

#Preview {
    let reminder = CDReminder.example
    TestCore(reminder: reminder)
        .environment(\.managedObjectContext, PersistentContainer.preview.container.viewContext)
}
