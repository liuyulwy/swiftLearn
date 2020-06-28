//
//  NetWork.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/28.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import Moya




// 超时时长
private var requestTimeOut:TimeInterval = 15
//在这个闭包中，你可以改变task，method，url, headers 或者 sampleResponse。比如，我们可能希望将应用程序名称设置到HTTP头字段中，从而用于服务器端分析。
let endpointClosure = {(target: API) -> Endpoint in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
//    defaultEndpoint = defaultEndpoint.adding(newHTTPHeaderFields: ["APP_NAME": "MY_AWESOME_APP"])
//   此处可根据不同的接口设置不同的配置，如超时时间不同设置
    return defaultEndpoint
}
//前面endpointClosure会把target映射为endpoint, Moya会把endpoint转换为一个真正的Request。
let requestClosure = { (endpoint: Endpoint, closure: MoyaProvider.RequestResultClosure) in
    do {
        var urlRequest = try endpoint.urlRequest()
        //设置请求时长
        urlRequest.timeoutInterval = requestTimeOut
        // 打印请求参数
//        if let requestData = urlRequest.httpBody {
//            print("\(urlRequest.url!)"+"\n"+"\(urlRequest.httpMethod ?? "")"+"发送参数"+"\(String(data: urlRequest.httpBody!, encoding: String.Encoding.utf8) ?? "")")
//        }else{
//            print("\(urlRequest.url!)"+"\(String(describing: urlRequest.httpMethod))")
//        }
        closure(.success(urlRequest))
    } catch MoyaError.requestMapping(let url) {
        closure(.failure(MoyaError.requestMapping(url)))
    } catch MoyaError.parameterEncoding(let error) {
        closure(.failure(MoyaError.parameterEncoding(error)))
    } catch {
        closure(.failure(MoyaError.underlying(error, nil)))
    }
}
//例如, .delayed(0.2) 可以把每个stub 请求延迟0.2s. 这个在单元测试中来模拟网络请求是非常有用的。
let stubClosure =  { (target: API) -> Moya.StubBehavior in
//    switch target {
//        /* Return something different based on the target. */
//    }
    return StubBehavior.never
}
//自定义一个 Alamofire.Manager实例对象。
let managerClosure: Manager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
    let manager = Manager(configuration: configuration)
    manager.startRequestsImmediately = false
    return manager
}()

let networkActivityPlugin = NetworkActivityPlugin.init { (type, target) in
    switch type {
    case .began:
        log.debug("show loading")
    case .ended:
        log.debug("close loading")
    }
}
func reversedPrint(_ separator: String, terminator: String, items: Any...) {
    for item in items {
        log.debug(item)
//        log.debug(separator)
//        log.debug(terminator)
    }
}
let networkLoggerPlugin = NetworkLoggerPlugin.init(verbose: true, cURL: false, output: reversedPrint, requestDataFormatter: nil) { (data) -> (Data) in
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)// Data 转 JSON
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)// JSON 转 Data，格式化输出。
        return prettyData
    } catch {
        return data
    }
}

let provider = MoyaProvider.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: nil, manager: managerClosure, plugins: [networkLoggerPlugin,networkActivityPlugin], trackInflights: false)
