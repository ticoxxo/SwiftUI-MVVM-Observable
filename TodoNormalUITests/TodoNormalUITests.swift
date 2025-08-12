//
//  TodoNormalUITests.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 11/08/25.
//
import XCTest

final class TodoNormalUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    @MainActor
    func testExample() {
        
        app.buttons["addNewReminderButton"].tap()
        
        
        app/*@START_MENU_TOKEN@*/.textFields["Add a title"]/*[[".otherElements.textFields[\"Add a title\"]",".textFields[\"Add a title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        

    }
}

