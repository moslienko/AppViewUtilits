//
//  File.swift
//
//
//  Created by Pavel Moslienko on 27.08.2019.
//

import SystemConfiguration

/// Check network status.
public enum Reachability {
    
    /// Types of network connections.
    enum NetworkConnectedType {
        case wifiOnly, cellularAndWifi
    }
    
    /// Checks if the device is connected to a network.
    /// - Parameter type: The type of network connection to check.
    /// - Returns: connect status.
    static func isConnectedToNetwork(type: NetworkConnectedType = .cellularAndWifi) -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        guard let defaultRouteReachabilityUnwrapped = defaultRouteReachability else { return false }
        if !SCNetworkReachabilityGetFlags(defaultRouteReachabilityUnwrapped, &flags) {
            return false
        }
        
        switch type {
        case .cellularAndWifi:
            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)
            return isReachable && !needsConnection
        case .wifiOnly:
            let isReachable = flags == .reachable
            let needsConnection = flags == .connectionRequired
            return isReachable && !needsConnection
        }
    }
}
