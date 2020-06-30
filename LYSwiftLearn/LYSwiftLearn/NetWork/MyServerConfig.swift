//
//  MyServerConfig.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/28.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import UIKit
public struct MyServerConfig {
    var baseUrl: String = "https://appapi-dev.yaozh.com/"
    var headers: [String: String]? = defaultHeaders()
    var parameters: [String: Any]? = defaultParameters()
    var timeoutInterval: Double = 15.0
    
    static let shared = MyServerConfig()
    private init() {}
    
    static func defaultHeaders() -> [String : String]? {
        return nil
    }
    
    static func defaultParameters() -> [String : Any]? {
        
        var parameters = [String : Any]()
        
        let timeStamp = String(Date().unixTimestamp.int)
        parameters["client"] = "iOS"
        parameters["timeStamp"] = timeStamp
        parameters["version"] = UIApplication.shared.version
        parameters["randStr"] = UUID().uuidString
        parameters["ip"] = getIP() ?? ""
        parameters["signature"] = signature(timeStamp: timeStamp,randStr: UUID().uuidString)
        return parameters
    }
    
    private static func signature(timeStamp:String, randStr:String) -> String {
        var array = [timeStamp, randStr, "newdb"]
        array = array.sorted { (a, b) -> Bool in
            return a.localizedStandardCompare(b) == .orderedAscending
        }
        return array.joined()
    }
}

