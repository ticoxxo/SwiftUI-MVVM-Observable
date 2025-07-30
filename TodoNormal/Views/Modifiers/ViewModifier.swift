//
//  ViewModifier.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//
import SwiftUI

extension View {
    func borderedText() -> some View {
        modifier(BorderedText())
    }
    
    func statusColor(_ status: Color) -> some View {
        modifier(StatusModifier(status: status))
    }
    
    func listItemStyle(_ color: Color) -> some View {
        modifier(ReminderItemRow(color: color))
    }
    
    func validateFormSection(_ bool: Bool) -> some View {
        modifier(ValidateSection(isValid: bool))
    }
}

struct BorderedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
    }
}

struct StatusModifier: ViewModifier {
    var status: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(status)
    }

}

struct ReminderItemRow: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding( 10)
            .frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(color ,lineWidth: 1)
            }
    }
}

struct ValidateSection: ViewModifier {
    var isValid: Bool
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(isValid ? .green : .red, lineWidth: 1)
            }
    }
}
