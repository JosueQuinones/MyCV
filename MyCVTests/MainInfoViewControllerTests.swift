//
//  MainInfoViewControllerTests.swift
//  MyCVTests
//
//  Created by Josue Emanuel Quinones Rivera on 6/4/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
@testable import MyCV

class MainInfoViewControllerTests: XCTestCase {

    func testInitialControllerTitleisCorrect() {
        //given
        let sut = MainInfoViewController.instantiate()
        //when
        sut.loadViewIfNeeded()
        //then
        XCTAssertEqual(sut.title, "THIS IS ME 🖥")
    }

    func testInitialViewControllerUpdateWithFetchedData() {
        //given
        let sut = MainInfoViewController.instantiate()
        let dummyMainInfo = MainInfo(name: "Josue", lastname: "Quiñones", photo: nil, age: "23", area: "Computer", university: "UNAM")
        let dummyContact = Contact(github: "JosueQuinones", twitter: "@CobainJosue")
        //when
        sut.loadViewIfNeeded()
        sut.model = Model(mainInfo: dummyMainInfo, technicalSkills: nil, softSkills: nil, hobbies: nil, contact: dummyContact)
        sut.setView()
        //then
        XCTAssertEqual(sut.nameLabel.text, "\(dummyMainInfo.name ?? "") \(dummyMainInfo.lastname ?? "")")
        XCTAssertEqual(sut.ageLabel.text, dummyMainInfo.age)
        XCTAssertEqual(sut.areaLabel.text, dummyMainInfo.area)
        XCTAssertEqual(sut.universityLabel.text, dummyMainInfo.university)
        XCTAssertEqual(sut.githubLabel.text, dummyContact.github)
        XCTAssertEqual(sut.twitterButton.titleLabel?.text, dummyContact.twitter)
    }
}
