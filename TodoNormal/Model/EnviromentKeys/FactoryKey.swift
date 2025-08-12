//
//  FactoryKey.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 23/07/25.
//
import SwiftUI

struct FactoryKey: EnvironmentKey {
    static let defaultValue: FactoryViewModel = FactoryViewModel()
}


extension EnvironmentValues {
    var factory: FactoryViewModel {
        get { self[FactoryKey.self] }
        set { self[FactoryKey.self] = newValue }
    }
}
