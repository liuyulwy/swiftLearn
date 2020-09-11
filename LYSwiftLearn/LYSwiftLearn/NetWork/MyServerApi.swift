//
//  MyServerApi.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/28.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import Moya

let serverApi = Networking<MyServerApi>.init()

enum MyServerApi {
    case mockResponse
    case userProfile(String)
    case userRepositories(String)
    case databaseNav
    case login(name: String, pwd: String, rgid: String, channel:String, first_installation:String)
}

extension MyServerApi: MyServerType {
    
    public var method: Moya.Method {
        return self.route.method
    }
    //配置路由
    public var route: Route {
        switch self {
        case .userProfile(_):
            return .get("path")
        case .databaseNav:
            return .get("config/getNavs")
        case .login(_, _, _, _, _):
            return .get("user/login")
        default: break
            
        }
        return .get("/path")
    }
    
    var path: String {
        return route.path
    }
    //设置参数
    public var parameters: [String : Any]? {
        var tempParameters: [String : Any] = [:]
        switch self {
        case .userProfile(let name):
            tempParameters["name"] = name
            
        case let .login(name, pwd, rgid, channel, first_installation):
            tempParameters["name"] = name
            tempParameters["pwd"] = pwd
            tempParameters["rgid"] = rgid
            tempParameters["channel"] = channel
            tempParameters["first_installation"] = first_installation
            
        default: break
            
        }
        if tempParameters.isEmpty {
            return MyServerConfig.defaultParameters
        }else {
            guard let defaultParameters = MyServerConfig.defaultParameters else {
                return tempParameters
            }
            tempParameters.merge(defaultParameters) { (current, _) -> Any in
                return current
            }
            return tempParameters
        }
    }
    
    public var task: Moya.Task {
        
        switch self {
        
        default:
            guard let parameters = self.parameters else { return .requestPlain }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    
    func encrypt(plaintext: String, salt: String) -> String {
        let b_salt = String.init(salt.utf8).md5().bytes
        let b_plaintext = String.init(plaintext.utf8).bytes
        var result = [UInt8]()
        var index = 0
        for b in b_plaintext {
            if index == 32 { index = 0}
            let s = b ^ b_salt[index]
            result.append(s)
            index = index + 1
        }
        return Data(result).base64EncodedString()
    }
    
    func decrypt(ciphertext: String, salt: String) -> String {
        let b_salt = String.init(salt.utf8).md5().bytes
        let b_ciphertext = Data(base64Encoded: ciphertext)?.bytes
        guard let b_text = b_ciphertext else {
            return ""
        }
        var result = [UInt8]()
        var index = 0
        for b in b_text {
            if index == 32 { index = 0}
            let s = b ^ b_salt[index]
            result.append(s)
            index = index + 1
        }
        return String(bytes: result, encoding: .utf8) ?? ""
    }
}
