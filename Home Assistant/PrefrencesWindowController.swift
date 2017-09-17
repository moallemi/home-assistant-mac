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
        
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        
    }
}
