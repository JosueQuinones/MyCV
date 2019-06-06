//
//  String+Localize.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 6/3/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "String not localized")
    }
}
