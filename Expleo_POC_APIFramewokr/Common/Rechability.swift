//
//  Rechability.swift
//  Expleo_POC_APIFramewokr
//
//  Created by kishor garkal on 25/04/24.
//

import Foundation
import SystemConfiguration

public class Reachability {
    static let shared = Reachability()
    
    private init() {}
    
    private let reachability = SCNetworkReachabilityCreateWithName(nil, "www.apple.com")
    private var isReachable: Bool {
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        return flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }
    
    var isConnected: Bool {
        isReachable
    }
}
