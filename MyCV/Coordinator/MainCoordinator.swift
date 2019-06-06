//
//  MainCoordinator.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var window: UIWindow?
    var mainNavigationController: UINavigationController?
    
    init(window: UIWindow?) {
        self.window = window
        showMainInfoView()
    }
    
    init() {
        showMainInfoView()
    }
    
    //MARK: - Flow
    func showMainInfoView() {
        let mainInfoViewcontroller = MainInfoViewController.instantiate()
        mainInfoViewcontroller.moreInfo = showMoreInfoView
        mainInfoViewcontroller.showTwitter = showTwitter
        mainInfoViewcontroller.showOkErrorAlert = showOkTryAgainErrorAlert
        mainNavigationController = UINavigationController(rootViewController: mainInfoViewcontroller)
        window?.rootViewController = mainNavigationController
        mainNavigationController?.navigationBar.barStyle = .black
        mainNavigationController?.navigationBar.barTintColor = .mainBlack
        mainNavigationController?.navigationBar.backgroundColor = .mainBlack
        mainNavigationController?.navigationBar.tintColor = .mainBlue
    }
    
    func showMoreInfoView(option: Int, model: Model?) {
        let moreInfoTableViewController = MoreInfoTableViewController.instantiate()
        moreInfoTableViewController.type = moreInfoType(option: option)
        moreInfoTableViewController.model = model
        mainNavigationController?.pushViewController(moreInfoTableViewController, animated: true)
    }
    
    func showTwitter(twitter: String?) {
        let webViewController = WKWebViewController.instantiate()
        guard let twitter = twitter else {
            return
        }
        webViewController.urlString = "twitter.com/\(twitter)"
        webViewController.done = webViewDone
        mainNavigationController?.pushViewController(webViewController, animated: true)
    }
    
    func showOkTryAgainErrorAlert(message: String?) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        alertController.addAction(UIAlertAction(title: "Try Again", style: .default) { [unowned self] _ in
            self.mainNavigationController?.popViewController(animated: true)
            self.showMainInfoView()
        })
        window?.rootViewController?.present(alertController, animated: true)
    }
    
    //MARK: - Auxiliar functions
    func webViewDone() {
        mainNavigationController?.popViewController(animated: true)
    }
    
    func moreInfoType(option: Int) -> MoreInfoType {
        switch option {
        case 0:
            return .technical
        case 1:
            return .soft
        case 2:
            return .hobbies
        default:
            return .technical
        }
    }
}
