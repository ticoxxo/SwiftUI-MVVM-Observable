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
