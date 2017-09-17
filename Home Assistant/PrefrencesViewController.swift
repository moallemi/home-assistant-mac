//
//  PrefrencesViewController.swift
//  Home Assistant
//
//  Created by Reza Moallemi on 9/17/17.
//  Copyright © 2017 Reza Moallemi. All rights reserved.
//

import Cocoa

class PrefrencesViewController: NSViewController {
    
    @IBOutlet weak var textFieldLocalAddress: NSTextField!
    @IBOutlet weak var textFieldGlobalAddress: NSTextField!
    @IBOutlet weak var comboDefaultAddress: NSComboBox!
    
    fileprivate let preferenceManager = PreferenceManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldLocalAddress.stringValue = preferenceManager.localAddress
        textFieldGlobalAddress.stringValue = preferenceManager.globalAddress
        comboDefaultAddress.selectItem(at: preferenceManager.defaultAddress)
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        
        saveSettings()
    }
    
    func saveSettings() {
        preferenceManager.localAddress = textFieldLocalAddress.stringValue
        preferenceManager.globalAddress = textFieldGlobalAddress.stringValue
        preferenceManager.defaultAddress = comboDefaultAddress.indexOfSelectedItem
    }
    
}
