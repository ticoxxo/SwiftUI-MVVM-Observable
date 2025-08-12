//
//  TodoNormalTests.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 11/08/25.
//
import Testing
@testable import TodoNormal

struct TodoNormalTests {
    
    @MainActor @Test func items_when_added_then_items_count_raised() async throws{
        //Given
        
        let vm = ReminderController(isPreviewMode: true)
        let count = vm.reminders.count
        let expectedCount = count + 1
        let newReminder = Reminder(title: "New Reminder", description: "This is a new reminder")
        //When
        vm.saveNewReminder(newReminder)
        
        //Expected
        #expect(vm.reminders.count == expectedCount, "Expected \(expectedCount) reminders, but found \(vm.reminders.count)")
    }
}
