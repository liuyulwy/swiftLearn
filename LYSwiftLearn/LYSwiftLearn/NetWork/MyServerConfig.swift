//
//  MyServerConfig.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/28.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation

public struct MyServerConfig {
    var baseUrl: String = "https://api.github.com"
    var headers: [String: String]? = defaultHeaders()
    var parameters: [String: Any]? = defaultParameters()
    var timeoutInterval: Double = 15.0
    
    static let shared = MyServerConfig()
    private init() {}
    
    static func defaultHeaders() -> [String : String]? {
        return ["deviceID" : "qwertyyu1234545",
                "Authorization": "tyirhjkkokjjjbggstvj"
        ]
    }
    
    static func defaultParameters() -> [String : Any]? {
        return ["platform" : "ios",
                "version" : "1.2.3",
        ]
    }
}
