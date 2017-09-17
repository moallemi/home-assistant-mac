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
    
    fileprivate let defaultAddressIndexKey = "Default Address Index"
    fileprivate let defaultAddressKey = "Default Address"
    fileprivate let localAddressKey = "Local Address"
    fileprivate let globalAddressKey = "Global Address"
    
    var defaultAddressIndex: Int {
        get {
            return userDefaults.integer(forKey: defaultAddressIndexKey)
        }
        
        set {
            userDefaults.set(newValue, forKey: defaultAddressIndexKey)
            
            if newValue == 0 && localAddress != "" {
                userDefaults.set(localAddress, forKey: defaultAddressKey)
            } else if newValue == 1 && globalAddress != "" {
                userDefaults.set(globalAddress, forKey: defaultAddressKey)
            } else {
                userDefaults.set("https://home-assistant.io/demo/", forKey: defaultAddressKey)
            }
        }
    }
    
    public private(set) var defaultAddress: String {
        get {
            return userDefaults.string(forKey: defaultAddressKey)!
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
            defaultAddressIndexKey: NSNumber(value: 1), // index 1 = Global
            localAddressKey: NSString(),
            defaultAddressKey: "https://home-assistant.io/demo/",
            globalAddressKey: "https://home-assistant.io/demo/"
            ] as [String : Any]
        
        userDefaults.register(defaults: factoryDefaults)
    }
    
    func synchronize() {
        userDefaults.synchronize()
    }
    
    func reset() {
        userDefaults.removeObject(forKey: defaultAddressKey)
        userDefaults.removeObject(forKey: defaultAddressIndexKey)
        userDefaults.removeObject(forKey: localAddressKey)
        userDefaults.removeObject(forKey: globalAddressKey)
        
        synchronize()
    }
}
