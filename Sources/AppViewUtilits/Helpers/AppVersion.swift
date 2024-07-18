//
//  AppVersion.swift
//  
//
//  Created by Pavel Moslienko on 04.04.2019
//

import Foundation

///Retrieving app version information.
public enum AppVersion {
    
    /// App version information.
    public struct Info {
        public var appName: String
        public var version: String
        public var build: String
        public var target: String
    }
    
    /// Retrieves the app's version information.
    public static func getInfo() -> Info {
        Info(appName: self.name, version: self.version, build: self.build, target: self.target)
    }
    
    /// Retrieves the app's current language.
    public static func getLanguage() -> String? {
        Locale.current.languageCode
    }
    
    /// Retrieves the app's display name.
    private static var name: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
    }
    
    /// Retrieves the app's version number.
    private static var version: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    /// Retrieves the app's build number.
    private static var build: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    }
    
    /// Retrieves the app's target environment.
    private static var target: String {
        var target: String = ""
        #if DEBUG
        target = "D"
        #else
        if Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" {
            target = "T"
        }
        #endif
        return target
    }
}
