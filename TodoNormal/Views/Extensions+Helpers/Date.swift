//
//  Date.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 25/07/25.
//
import Foundation

extension Date {
    public func addDays(_ days: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    public func toString(format: DateFormatter) -> String {
        return format.string(from: self)
    }
}
