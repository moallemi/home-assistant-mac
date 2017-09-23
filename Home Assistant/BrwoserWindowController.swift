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
        
        window?.titlebarAppearsTransparent = true
        window?.backgroundColor = NSColor(hexString: "#03A9F4")

        super.windowDidLoad()
    }

}
