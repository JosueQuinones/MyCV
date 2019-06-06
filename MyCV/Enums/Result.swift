//
//  Result.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 6/17/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

public enum Result<Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)
}
