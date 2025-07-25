//
//  ReminderRow.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 25/07/25.
//
import SwiftUI
struct ReminderItemText: View {
    var description: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(description)
                .font(.title3)
                .bold()
        }
    }
}

extension ReminderItemText {
    init(content: ReminderItem) {
        self.description = content.description
    }
}
