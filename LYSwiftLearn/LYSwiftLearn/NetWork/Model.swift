//
//  Model.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/7/1.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
extension Array: HandyJSON {}
protocol BaseModelProtocol: HandyJSON {}

class ResponseData: BaseModelProtocol {
    var code: Int = 0
    var msg: String = ""
    var success: Bool = false
    var data: BaseModelProtocol?
    var jsonData: [String:Any]?
    required init() {}
}

class NavItems: ResponseData {
    
    
}
