//
//  AppDelegate.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        coordinator = MainCoordinator(window: window)
        
        return true
    }
}

