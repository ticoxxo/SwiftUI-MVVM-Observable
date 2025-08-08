//
//  ReminderRow.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 25/07/25.
//
import SwiftUI
struct ReminderRowText: View {
    var title: String
    var description: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .bold()
            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(nil)
        }
    }
}

