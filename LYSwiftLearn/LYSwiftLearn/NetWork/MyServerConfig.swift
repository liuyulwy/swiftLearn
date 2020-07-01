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
    static let baseUrl: String = "https://appapi-dev.yaozh.com/"
    static let timeoutInterval: Double = 15.0
    
    static let shared = MyServerConfig()
    private init() {}
    
    static var defaultHeaders:[String : String]? {
        return nil
    }
    
    static var defaultParameters: [String : Any]? {
        var parameters = [String : Any]()
        let timeStamp = String(Date().unixTimestamp.int)
        let randStr = UUID().uuidString
        parameters["client"] = "iOS"
        parameters["timeStamp"] = timeStamp
        parameters["version"] = UIApplication.shared.version
        parameters["randStr"] = randStr
        parameters["ip"] = getIP() ?? ""
        parameters["signature"] = MyServerConfig.signature(timeStamp: timeStamp,randStr: randStr)
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

