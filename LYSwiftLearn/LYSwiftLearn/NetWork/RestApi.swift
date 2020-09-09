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
    
    func getDatabaseNav() -> Single<ResponseArrayData<NavItems>> {
        return networking.requetModel(.databaseNav, ResponseArrayData<NavItems>.self)
    }
}
