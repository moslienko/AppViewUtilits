//
//  File.swift
//  
//
//  Created by Pavel Moslienko on 27.08.2019.
//

import SystemConfiguration

public enum Reachability {
    
    enum NetworkConnectedType {
        case wifiOnly, cellularAndWifi
    }
    
    static func isConnectedToNetwork(type: NetworkConnectedType = .cellularAndWifi) -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        guard let defaultRouteReachabilityUnwrapped = defaultRouteReachability else { return false }
        if SCNetworkReachabilityGetFlags(defaultRouteReachabilityUnwrapped, &flags) == false {
            return false
        }
        
        switch type {
        case .cellularAndWifi:
            let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
            let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
            let ret = (isReachable && !needsConnection)
            
            return ret
        case .wifiOnly:
            let isReachable = flags == .reachable
            let needsConnection = flags == .connectionRequired
            
            return isReachable && !needsConnection
        }
        
    }
}
