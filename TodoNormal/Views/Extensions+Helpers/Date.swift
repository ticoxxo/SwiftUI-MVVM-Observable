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
    
    public func addYears(_ years: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .year, value: years, to: self) ?? self
    }
    
    public func addMonths(_ months: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: months, to: self) ?? self
    }
    
    public func addCustom(dd: Int, mm: Int, yy: Int ) -> Date {
        return self.addDays(dd).addMonths(mm).addYears(yy)
    }
    
    public func toString(format: DateFormatter) -> String {
        return format.string(from: self)
    }
}
