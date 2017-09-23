//
//  BrwoserWindowController.swift
//  Home Assistant
//
//  Created by Reza Moallemi on 9/17/17.
//  Copyright © 2017 Reza Moallemi. All rights reserved.
//

import Cocoa

class BrwoserWindowController: NSWindowController {

    override func windowDidLoad() {
        shouldCascadeWindows = false
        window?.setFrameAutosaveName(NSWindow.FrameAutosaveName(rawValue: "MainWindow"))
        
        super.windowDidLoad()
    }

}
