//
//  ReminderItem.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

struct TextItemRow: View {
    var description: String
    var status: Color
    var footnote: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(description)
                .font(.headline)
            Text(footnote)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
        
}

extension TextItemRow {
    init(item: ReminderItem) {
        description = item.description
        status = item.status.color
        if let date = item.dueDate {
            footnote = "Terminar antes de \(date.toString(format: DateFormatter.mediumDate)) "
        } else {
            footnote = "Sin fecha límite"
        }
    }
}

#Preview {
    TextItemRow(item: ReminderController.defaultList[2].reminderItems[1])
}



