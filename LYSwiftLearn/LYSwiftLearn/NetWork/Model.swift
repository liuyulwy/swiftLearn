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
class BaseModel: BaseModelProtocol{
    required init() {}
    func willStartMapping() {}
    func didFinishMapping() {}
    func mapping(mapper: HelpingMapper) {}
}

class ResponseData: BaseModel {
    var code: Int = 0
    var msg: String = ""
    var success: Bool = false
    required init() {}
    
    override func didFinishMapping() {
        success = (code == 200 ? true : false)
    }
}

class ReturnArrayData<T: BaseModel>: ResponseData {
    var data:[T]?
    required init() {}
}

class ReturnData<T: BaseModel>: ResponseData {
    var data:T?
    required init() {}
}

class NavItems: BaseModel {
    var pid: Int?
    var type: Int?
    var label: String?
    var side_href: String?
    var navlabel: String?
    var groupList: [GroupList]?
    required init() {}
}

class GroupList: BaseModel {
    var label: String?
    var group: [Items]?
    required init() {}
}

class Items: BaseModel {
    var commonId: Int?
    var pid: Int?
    var navlabel: Int?
    var type: Int?
    var label: String?
    var title: String?
    var href: String?
    var side_href: String?
    required init() {}
}
