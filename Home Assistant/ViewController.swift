//
//  ViewController.swift
//  Home Assistant
//
//  Created by Reza Moallemi on 9/14/17.
//  Copyright © 2017 Reza Moallemi. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setFrameSize(NSSize(width: 1024, height: 768))
        
        webView.load(URLRequest(url: URL(string: "https://google.com")!))
    }
}

