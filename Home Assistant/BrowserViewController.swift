//
//  ViewController.swift
//  Home Assistant
//
//  Created by Reza Moallemi on 9/14/17.
//  Copyright © 2017 Reza Moallemi. All rights reserved.
//

import Cocoa
import WebKit

class BrowserViewController: NSViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        webView.load(URLRequest(url: URL(string: PreferenceManager.sharedInstance.defaultAddress)!))
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showDialog(message: error.localizedDescription, info: "")
    }
    
    func showDialog(message: String, info: String) {
        let alert: NSAlert = NSAlert()
        alert.messageText = message
        alert.informativeText = info
        alert.alertStyle = NSAlertStyle.critical
        alert.addButton(withTitle: "OK")
        alert.beginSheetModal(for: view.window!, completionHandler: nil)
    }
    
}

