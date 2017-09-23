//
//  Prefrences.swift
//  Home Assistant
//
//  Created by Reza Moallemi on 9/16/17.
//  Copyright © 2017 Reza Moallemi. All rights reserved.
//

import Cocoa

class PrefrencesWindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.floatingWindow)))
        
        window?.delegate = contentViewController as? NSWindowDelegate
    }

}
