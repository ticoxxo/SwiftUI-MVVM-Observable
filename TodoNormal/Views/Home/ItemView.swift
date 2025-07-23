//
//  ReminderItem.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

struct ItemView: View {
    var description: String
    var status: Color
    var footnote: String
    
    
    var body: some View {
        VStack {
            Text(description)
                .font(.headline)
            Text(footnote)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .borderedText()
        .statusColor(status)
    }
        
}

extension ItemView {
    init(item: ReminderItem) {
        description = item.description
        status = item.status.color
        footnote = ""
    }
}

#Preview {
    ItemView(description: "Hacer la casa",
             status: .red,
    footnote: "Hoy a las 12:00")
}



