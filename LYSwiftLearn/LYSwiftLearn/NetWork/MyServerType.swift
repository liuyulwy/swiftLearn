//
//  MyServerType.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/28.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import Moya

public protocol MyServerType: Moya.TargetType {
    var isShowLoading: Bool { get }
    var parameters: [String: Any]? { get }
    var route: Route { get }
}

extension MyServerType {
    //服务器地址
    public var baseURL: URL {
        return URL.init(string: MyServerConfig.shared.baseUrl)!
    }
    
    //请求头
    public var headers: [String : String]? {
        return MyServerConfig.shared.headers
    }
    
    //请求路径
    public var path: String {
        return ""
    }
    
    //请求类型
    public var method: Moya.Method {
        return .get
    }
    //请求参数
    public var parameters: [String: Any]? {
        return MyServerConfig.shared.parameters
    }
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        return .requestPlain
    }
    
    //单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    //验证
    public var validationType: ValidationType {
        return .successCodes
    }
    
    var isShowLoading: Bool {
        return false
    }
}

