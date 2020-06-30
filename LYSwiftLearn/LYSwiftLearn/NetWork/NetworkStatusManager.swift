//
//  NetworkStatusManager.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/30.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import Alamofire
class NetworkStatusManager {
    static let sharedManager = NetworkStatusManager()
    private init() {}
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: MyServerConfig.shared.baseUrl)
    var isReachable: Bool { return reachabilityManager?.isReachable ?? false }
    var isReachableOnWWAN: Bool { return reachabilityManager?.isReachableOnWWAN ?? false }
    var isReachableOnWiFi: Bool { return reachabilityManager?.isReachableOnEthernetOrWiFi ?? false }
    
    func startNetworkReachabilityObserver() {
        reachabilityManager?.listener = { status in
            switch status {
            case .notReachable:
                print("The network is not reachable")
                
            case .unknown :
                print("It is unknown whether the network is reachable")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
                
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
            }
        }
        reachabilityManager?.startListening()
    }
    
    deinit {
        reachabilityManager?.stopListening()
    }
    
}
