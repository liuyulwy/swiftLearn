//
//  LYApi.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/23.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import Moya

public enum API {
    case channels  //获取频道列表
    case playlist(String) //获取歌曲
}

extension API: TargetType {
    //服务器地址
    public var baseURL: URL {
        switch self {
        case .channels:
            return URL.init(string: "https://www.douban.com")!
        case .playlist(_):
            return URL.init(string: "https://douban.fm")!
        }
    }
    
    //请求路径
    public var path: String {
        switch self {
        case .channels:
            return "/j/app/radio/channels"
        case .playlist(_):
            return "/j/mine/playlist"
        }
    }
    
    //请求类型
    public var method: Moya.Method {
        return .get
    }
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .playlist(let channel):
            var params: [String: Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    //单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    //请求头
    public var headers: [String : String]? {
        return nil
    }
    
    //验证
    public var validationType: ValidationType {
        return .successCodes
    }
    
}
