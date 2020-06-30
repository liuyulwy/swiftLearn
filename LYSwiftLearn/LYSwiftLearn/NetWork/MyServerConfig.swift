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
        return ["deviceID" : "qwertyyu1234545",
                "Authorization": "tyirhjkkokjjjbggstvj"
        ]
    }
    
    static func defaultParameters() -> [String : Any]? {
        
        var parameters = [String : Any]()
        parameters["client"] = "iOS"
        parameters["timeStamp"] = String(Date().unixTimestamp.int)
        parameters["version"] = UIApplication.shared.version
        parameters["randStr"] = UUID().uuidString
        return parameters
    }
}
//NSString *timeStamp = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
//NSString *randStr = [self stringWithUUID];
//NSString *signature = [[self class] yz_signatureWithTimeStamp:timeStamp randStr:randStr];
//NSString *netIP = [PhoneIP deviceIP];
//NSMutableDictionary *mDic = [[NSMutableDictionary alloc] init];
//[mDic setObject:timeStamp forKey:@"timeStamp"];
//[mDic setObject:randStr forKey:@"randStr"];
//[mDic setObject:signature forKey:@"signature"];
//[mDic setObject:netIP forKey:@"ip"];
//[mDic setObject:@"iOS" forKey:@"client"];
//[mDic setObject:kApplication.appVersion forKey:@"version"];
