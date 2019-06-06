//
//  MoreInfoTableViewControllerTests.swift
//  MyCVTests
//
//  Created by Josue Emanuel Quinones Rivera on 6/4/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
@testable import MyCV

class MoreInfoTableViewControllerTests: XCTestCase {
    
    func testTechnicalSkillsTableViewCorrectNumberOfRows() {
        //given
        let sut = MoreInfoTableViewController.instantiate()
        let dummyTechnicalSkills = TechnicalSkills(programmingLanguages: [["C","60"]], technologies: nil, DBMS: nil)
        let dummyModel = Model(mainInfo: nil, technicalSkills: dummyTechnicalSkills, softSkills: nil, hobbies: nil, contact: nil)
        //when
        sut.type = .technical
        sut.model = dummyModel
        sut.loadView()
        //then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 1), 0)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 2), 0)
    }
    
    func testSoftSkillsTableViewCorrectNumberOfRows() {
        //given
        let sut = MoreInfoTableViewController.instantiate()
        let dummySoftSkils = ["Cool"]
        let dummyModel = Model(mainInfo: nil, technicalSkills: nil, softSkills: dummySoftSkils, hobbies: nil, contact: nil)
        //when
        sut.type = .soft
        sut.model = dummyModel
        sut.loadView()
        //then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func testHobbiesTableViewCorrectNumberOfRows() {
        //given
        let sut = MoreInfoTableViewController.instantiate()
        let dummyHobbies = ["Fornai", "Halo"]
        let dummyModel = Model(mainInfo: nil, technicalSkills: nil, softSkills: nil, hobbies: dummyHobbies, contact: nil)
        //when
        sut.type = .hobbies
        sut.model = dummyModel
        sut.loadView()
        //then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }

    func testTechnicalSkillsCellHaveCorrectData() {
        //given
        let sut = MoreInfoTableViewController.instantiate()
        let dummyTechnicalSkills = TechnicalSkills(programmingLanguages: [["C","60"]], technologies: nil, DBMS: [["Oracle", "70"]])
        let dummyModel = Model(mainInfo: nil, technicalSkills: dummyTechnicalSkills, softSkills: nil, hobbies: nil, contact: nil)
        //when
        sut.type = .technical
        sut.model = dummyModel
        sut.loadView()
        //then
        dummyTechnicalSkills.programmingLanguages?.forEach { language in
            guard let cell = sut.tableView.cellForRow(at: IndexPath(row: dummyTechnicalSkills.programmingLanguages?.firstIndex(of: language) ?? 0, section: 0)) as? SkillTableViewCell  else {
                return
            }
            XCTAssertEqual(cell.skillLabel.text, language[0])
           
        }
        
    }
}
