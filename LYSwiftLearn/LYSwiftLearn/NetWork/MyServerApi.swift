//
//  MyServerApi.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/28.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import Moya
enum MyServerApi {
    case mockResponse
    case userProfile(String)
    case userRepositories(String)
}

extension MyServerApi: MyServerType {
    
    //设置参数
    public var parameters: [String : Any]? {
        var tempParameters: [String : Any] = [:]
        switch self {
        case .userProfile(let name):
            tempParameters["name"] = name
        default: break
            
        }
        if tempParameters.isEmpty {
            return MyServerConfig.shared.parameters
        }else {
            guard let defaultParameters = MyServerConfig.shared.parameters else {
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
        case .mockResponse:
            guard let parameters = self.parameters else { return .requestPlain }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
}
