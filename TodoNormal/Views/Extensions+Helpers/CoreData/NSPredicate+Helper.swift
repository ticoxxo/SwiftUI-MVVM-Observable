//
//  NSPredicate.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 15/08/25.
//
import Foundation

extension NSPredicate {
    
    @MainActor static let all = NSPredicate(format: "TRUEPREDICATE")
    @MainActor static let none = NSPredicate(format: "FALSEPREDICATE")
    
}
