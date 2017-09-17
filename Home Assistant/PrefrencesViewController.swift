//
//  PrefrencesViewController.swift
//  Home Assistant
//
//  Created by Reza Moallemi on 9/17/17.
//  Copyright © 2017 Reza Moallemi. All rights reserved.
//

import Cocoa

class PrefrencesViewController: NSViewController, NSWindowDelegate {
    
    @IBOutlet weak var textFieldLocalAddress: NSTextField!
    @IBOutlet weak var textFieldGlobalAddress: NSTextField!
    @IBOutlet weak var comboDefaultAddress: NSComboBox!
    
    fileprivate let preferenceManager = PreferenceManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldLocalAddress.stringValue = preferenceManager.localAddress
        textFieldGlobalAddress.stringValue = preferenceManager.globalAddress
        comboDefaultAddress.selectItem(at: preferenceManager.defaultAddressIndex)
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        
        saveSettings()
    }
    
    func saveSettings() {
        preferenceManager.localAddress = textFieldLocalAddress.stringValue
        preferenceManager.globalAddress = textFieldGlobalAddress.stringValue
        preferenceManager.defaultAddressIndex = comboDefaultAddress.indexOfSelectedItem
        
        preferenceManager.synchronize()
    }
    
    func windowShouldClose(_ sender: Any) -> Bool {
        let result = areSettingsValid()
        if result {
            NSApplication.shared().stopModal()
        }
        return result
    }
    
    func areSettingsValid() -> Bool {
        if comboDefaultAddress.indexOfSelectedItem == 0 && !validUrl(textFieldLocalAddress.stringValue) {
            showDialog(question: "Invalid Local Address!", text: "Please check local url address again")
            return false
        }
        if comboDefaultAddress.indexOfSelectedItem == 1 && !validUrl(textFieldGlobalAddress.stringValue) {
            showDialog(question: "Invalid Global Address!", text: "Please check global url address again")
            return false
        }
        return true
    }
    
    func validUrl(_ urlString: String?) -> Bool {
        let url: NSURL? = NSURL(string: urlString!)
        
        if url != nil && urlString?.characters.count != 0 {
            return true
        }
        return false
    }
    
    func showDialog(question: String, text: String) {
        let alert: NSAlert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = NSAlertStyle.critical
        alert.addButton(withTitle: "OK")
        alert.beginSheetModal(for: view.window!, completionHandler: nil)
    }
}
