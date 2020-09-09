//
//  MyServerType.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/28.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public protocol MyServerType: Moya.TargetType {
    var isShowLoading: Bool { get }
    var parameters: [String: Any]? { get }
    var route: Route { get }
}

extension MyServerType {
    //服务器地址
    public var baseURL: URL {
        return URL.init(string: MyServerConfig.baseUrl)!
    }
    
    //请求头
    public var headers: [String : String]? {
        return MyServerConfig.defaultHeaders
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
        return MyServerConfig.defaultParameters
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
        return .none
    }
    
    var isShowLoading: Bool {
        return false
    }
}

extension ObservableType where Element == Response {
    public func mapModel<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapModel(T.self))
        }
    }
}
extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        guard let object = JSONDeserializer<T>.deserializeFrom(json: try mapString()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
}
