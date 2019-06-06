//
//  MyCVTests.swift
//  MyCVTests
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
@testable import MyCV

class NetworkingTest: XCTestCase {

    var model = Model()
    
    override func setUp() {
        let expectation = self.expectation(description: "Fetching")
        Networking.shared.getModel(model: model) { info in
            self.model = info ?? Model()
            expectation.fulfill()
        }
    }

    override func tearDown() {
        model = Model()
        super.tearDown()
    }
    
    func testProgLanguages() {
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(model.technicalSkills?.programmingLanguages?.count ?? 0 > 0)
    }
    
    func testMainInfo() {
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(model.mainInfo, "The mainInfo is needed")
    }
    
    func testContact() {
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(model.contact, "The contact info is required")
    }
    
    func testValidPhoto() {
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(URL(string: model.mainInfo?.photo ?? ""), "Error with the photo URL")
    }
    
    func testURLFoWebView() {
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(model.contact?.twitter, "The twitter account is needed for the webView")
    }
}
