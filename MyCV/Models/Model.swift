//
//  Model.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

struct Model: Codable {
    var mainInfo: MainInfo?
    var technicalSkills: TechnicalSkills?
    var softSkills: [String]?
    var hobbies: [String]?
    var contact: Contact?
}

struct MainInfo: Codable {
    var name: String?
    var lastname: String?
    var photo: String?
    var age: String?
    var area: String?
    var university: String?
}

struct TechnicalSkills: Codable {
    var programmingLanguages: [[String]]?
    var technologies: [[String]]?
    var DBMS: [[String]]?
}

struct Contact: Codable {
    var github: String?
    var twitter: String?
}
