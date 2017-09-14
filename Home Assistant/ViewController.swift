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

        webView.load(URLRequest(url: URL(string: "")!))
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

