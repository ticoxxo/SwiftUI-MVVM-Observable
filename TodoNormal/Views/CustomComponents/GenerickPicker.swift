//
//  GenerickPicker.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 13/08/25.
//
import SwiftUI
import Foundation

struct PickerView<T: Hashable & Identifiable>: View {
    @Binding var item: T
    var options: [T]
    var label: (T) -> String
        
        var body: some View {
            Picker("",selection: $item) {
                ForEach(options) { option in
                    Text(label(option))
                }
            }
            .labelsHidden()
        }
    }
