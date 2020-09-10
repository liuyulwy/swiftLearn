//
//  RestApi.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/9/9.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import RxSwift

class RestApi {
    static let `defualt` = RestApi()
    let networking = Networking<MyServerApi>()
    private init() {}
   
}

extension RestApi {
    private func requestModel<T: ResponseData>(target: MyServerApi, type: T.Type) -> Single<T> {
        return networking.requestModel(target, type)
    }
}

extension RestApi {
    
    func getDatabaseNav() -> Single<ResponseArrayData<NavItems>> {
        return requestModel(target: .databaseNav, type: ResponseArrayData<NavItems>.self)
    }
    
    func login(name: String, pwd: String, rgid: String = "", channel:String = "apple", first_installation:String = "") -> Single<ResponseObjectData<LoginInfoModel>>{
        return requestModel(target: .login(name: name, pwd: pwd, rgid: rgid, channel: channel, first_installation: first_installation), type: ResponseObjectData<LoginInfoModel>.self)
    }
}
