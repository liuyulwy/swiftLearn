//
//  NetWork.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/28.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import Moya
import RxSwift
public struct Networking<T: MyServerType> {
    public let provider: MoyaProvider<T>
    public init(provider: MoyaProvider<T> = defaultProvider()) {
        self.provider = provider
    }
}

extension Networking {
    public static func defaultProvider() -> MoyaProvider<T> {
        return MoyaProvider.init(endpointClosure: self.endpointClosure(), requestClosure: self.requestClosure(), stubClosure: self.stubClosure(), callbackQueue: nil, session:self.defaultAlamofireSession(), plugins: self.plugins, trackInflights: false)
    }
}

extension Networking {
    public static func endpointClosure() -> (T) ->Endpoint{
        //在这个闭包中，你可以改变task，method，url, headers 或者 sampleResponse。比如，我们可能希望将应用程序名称设置到HTTP头字段中，从而用于服务器端分析。
        return { target in
            //            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            //    defaultEndpoint = defaultEndpoint.adding(newHTTPHeaderFields: ["APP_NAME": "MY_AWESOME_APP"])
            //   此处可根据不同的接口设置不同的配置，如超时时间不同设置
            let defaultEndpoint = Endpoint.init(
                url: URL(target: target).absoluteString,
                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
            return defaultEndpoint
        }
    }
    
    public static func requestClosure() -> MoyaProvider<T>.RequestClosure {
        return { (endpoint: Endpoint, closure: MoyaProvider.RequestResultClosure) in
            do {
                var urlRequest = try endpoint.urlRequest()
                //设置请求时长
                urlRequest.timeoutInterval = MyServerConfig.timeoutInterval
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
    }
    //例如, .delayed(0.2) 可以把每个stub 请求延迟0.2s. 这个在单元测试中来模拟网络请求是非常有用的。
    public static func stubClosure() -> MoyaProvider<T>.StubClosure {
        //    switch target {
        //        /* Return something different based on the target. */
        //    }
        //        return MoyaProvider.neverStub
        return { target in
            return .never
        }
    }
    
    //自定义一个 Alamofire.Session实例对象。
    public static func defaultAlamofireSession() -> Session {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default

        return Session(configuration: configuration, startRequestsImmediately: false)
    }
    
    public static var plugins: [PluginType] {
        let networkActivityPlugin = NetworkActivityPlugin.init { (type, target) in
            switch type {
            case .began:
                log.debug("show loading")
            case .ended:
                log.debug("close loading")
            }
        }
        
//        let networkLoggerPlugin = NetworkLoggerPlugin.init(verbose: true, cURL: false, output: { (_ separator: String, _ terminator: String, _ items: Any...) in
//            for item in items {
//                log.debug(item)
//                //        log.debug(separator)
//                //        log.debug(terminator)
//            }
//        }, requestDataFormatter: nil) { (data) -> (Data) in
//            do {
//                let dataAsJSON = try JSONSerialization.jsonObject(with: data)// Data 转 JSON
//                let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)// JSON 转 Data，格式化输出。
//                return prettyData
//            } catch {
//                return data
//            }
//        }
        return [networkActivityPlugin]
    }
}

extension Networking {
    
    func requet<M: ResponseData>(_ target: T,_ model: M.Type) -> Single<M>{
        
        return Single.create { (single) -> Disposable in
            let cancellableToken = self.provider.request(target) { result in
                switch result {
                case let .success(response):
                    do {
                        let dataString = try response.mapString()// Data 转 JSON
                        let object = JSONDeserializer<M>.deserializeFrom(json: dataString)
                        if object != nil {
                            if object!.success {
                                single(.success(object!))
                            }else {
                                let object = NetworkError.init(code: object!.code, msg: object!.msg)
                                single(.error(object))
                            }
                            
                        }else {
                            let object = NetworkError.init(code: 100, msg: "数据格式错误，解析失败！")
                            single(.error(object))
                        }
                        
                    } catch {
                        let object = NetworkError.init(code: 100, msg: "数据格式错误，解析失败！")
                        single(.error(object))
                    }
                    
                case let .failure(error):
                    let object = NetworkError.init(code: 100, msg: error.localizedDescription)
                    single(.error(object))
                }
            }
            
            return Disposables.create {
                cancellableToken.cancel()
            }
        }
        
    }
    
    
}


