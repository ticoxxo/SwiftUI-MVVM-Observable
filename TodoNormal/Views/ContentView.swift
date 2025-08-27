//
//  ContentView.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 03/06/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            Home()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                        }
                        .accessibilityIdentifier("addNewReminderButton")
                    }
                }
                .navigationTitle("Home")
        }
    }
        
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistentContainer.preview.container.viewContext)
}
