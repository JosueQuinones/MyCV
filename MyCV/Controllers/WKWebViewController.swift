//
//  WKWebViewController.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 6/1/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController, WKNavigationDelegate, Storyboarded {
    
    //MARK: - Class variables
    var webView: WKWebView!
    var urlString: String?
    
    //MARK: - Closures for coordinator
    var done: () -> Void = { }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setURL()
    }
    
    //MARK: - Class Methods
    func setView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(webViewDone))
    }
    
    @objc func webViewDone() {
        done()
    }

    func setURL() {
        guard var urlString = urlString else {
            return
        }
        urlString = "https://\(urlString)"
        guard let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
