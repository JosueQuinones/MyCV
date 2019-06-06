//
//  MyCVUITests.swift
//  MyCVUITests
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest

class MyCVUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testScrollInitialStateIsCorrect() {
        let basicInfoElement = XCUIApplication().scrollViews.otherElements.containing(.staticText, identifier:"Basic Info.").element
        basicInfoElement.swipeUp()
        basicInfoElement.swipeDown()
    }
    
    func testTechnicalTable() {
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["Technical"].tap()
        XCTAssertTrue(app.navigationBars["Technical Skills"].buttons.firstMatch.exists)
    }
    
    func testSoftTable() {
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["Soft"].tap()
        XCTAssertTrue(app.navigationBars["Soft Skills"].buttons.firstMatch.exists)
    }
    
    func testHobbiesTable() {
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["Hobbies"].tap()
        XCTAssertTrue(app.navigationBars["Hobbies"].buttons.firstMatch.exists)
    }
    
    func testWebViewFlow() {
        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Basic Info.").element.swipeUp()
        scrollViewsQuery.otherElements.buttons["@CobainJosue"].tap()
        app.navigationBars.firstMatch.buttons["Done"].tap()
    }
    
    func testMoreInfoButtonsExists() {
        XCTAssertTrue(XCUIApplication().scrollViews.otherElements.buttons["Technical"].exists)
        XCTAssertTrue(XCUIApplication().scrollViews.otherElements.buttons["Soft"].exists)
        XCTAssertTrue(XCUIApplication().scrollViews.otherElements.buttons["Hobbies"].exists)
    }
}
