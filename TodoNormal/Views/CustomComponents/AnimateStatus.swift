//
//  AnimateStatus.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 25/07/25.
//
import SwiftUI

struct AnimateStatus: View {
    @State private var isRotated = false
    var symbolo: String
    var color: Color
    
    
    var body: some View {
        
            Image(systemName: symbolo)
                .rotationEffect(.degrees(isRotated ? 360 : 0))
                .scaleEffect(isRotated ? 1.5 : 1)
                .foregroundColor(color)
                .animation(.easeInOut(duration: 0.6), value: isRotated)
                .task {
                    isRotated.toggle()
                }
 
    }
}

#Preview {
    AnimateStatus(symbolo: "star.fill", color: .yellow)
}
