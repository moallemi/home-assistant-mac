//
//  PrefrencesManager.swift
//  Home Assistant
//
//  Created by Reza Moallemi on 9/16/17.
//  Copyright © 2017 Reza Moallemi. All rights reserved.
//

import Foundation

class PreferenceManager {
    // Single instance
    static let sharedInstance = PreferenceManager()
    
    fileprivate init() {
        registerFactoryDefaults()
    }
    
    let userDefaults = UserDefaults.standard
    
    fileprivate let defaultAddressKey = "Default Address"
    fileprivate let localAddressKey = "Local Address"
    fileprivate let globalAddressKey = "Global Address"
    
    var defaultAddress: Int {
        get {
            return userDefaults.integer(forKey: defaultAddressKey)
        }
        
        set {
            userDefaults.set(newValue, forKey: defaultAddressKey)
        }
    }
    
    var localAddress: String {
        get {
            return userDefaults.string(forKey: localAddressKey)!
        }
        
        set {
            userDefaults.set(newValue, forKey: localAddressKey)
        }
    }
    
    var globalAddress: String {
        get {
            return userDefaults.string(forKey: globalAddressKey)!
        }
        
        set {
            userDefaults.set(newValue, forKey: globalAddressKey)
        }
    }
    
    fileprivate func registerFactoryDefaults() {
        let factoryDefaults = [
            defaultAddressKey: NSNumber(value: 0), // index 0 = Local
            localAddressKey: NSString(),
            globalAddressKey: NSString()
            ] as [String : Any]
        
        userDefaults.register(defaults: factoryDefaults)
    }
    
    func synchronize() {
        userDefaults.synchronize()
    }
    
    func reset() {
        userDefaults.removeObject(forKey: defaultAddressKey)
        userDefaults.removeObject(forKey: localAddressKey)
        userDefaults.removeObject(forKey: globalAddressKey)
        
        synchronize()
    }
}
