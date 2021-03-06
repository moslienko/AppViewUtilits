//
//  AppVersion.swift
//  
//
//  Created by Pavel Moslienko on 04.04.2019
//

import Foundation

public enum AppVersion {
    
    public struct Info {
        public var appName: String
        public var version: String
        public var build: String
        public var target: String
    }
    
    public static func getInfo() -> Info {
        return Info(appName: self.name, version: self.version, build: self.build, target: self.target)
    }
    
    public static func getLanguage() -> String? {
        guard let language = Locale.current.languageCode else { return nil }
        return language
    }
    
    private static var name: String {
        if let displayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return displayName
        }
        
        return ""
    }
    
    private static var version: String {
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        return versionNumber ?? ""
    }
    
    private static var build: String {
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        return buildNumber ?? ""
    }
    
    private static var target: String {
        var target: String = ""
        #if DEBUG
        target = "D"
        #else
        let isTestFlight = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
        if isTestFlight {
            target = "T"
        }
        #endif
        return target
    }
    
}
