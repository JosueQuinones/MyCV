//
//  UIApplication+ServerURL.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

extension UIApplication {
    static var serverURL: String? {
        return Bundle.main.object(forInfoDictionaryKey: "ServerURL") as? String
    }
}
