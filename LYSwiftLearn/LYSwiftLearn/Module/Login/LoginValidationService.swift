//
//  LoginValidationService.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/8/25.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import RxSwift

enum ValidationResult {
    case ok(message: String)
    case logining
    case empty
    case failed(message: String)
}

extension ValidationResult {
    var isValid: Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
    
}


class LoginValidationService {
    static let `default` = LoginValidationService()
    private init() {}
    
    let minUserNameCount = 8
    let maxUserNameCount = 20
    
    let minPasswordCount = 8
    let maxPasswordCount = 20
    
    func validateUserName(userName: String) -> ValidationResult {
        if userName.isEmpty {
            return .empty
        }
        if userName.count < 8 || userName.count > 20 {
            return .failed(message: "用户名8-20位")
        }
        
        return .ok(message: "用户名验证成功")
    }
    
    func validatePassword(passworld: String) -> ValidationResult {
        if passworld.isEmpty {
            return .empty
        }
        if passworld.count < 8 || passworld.count > 20 {
            return .failed(message: "密码8-20位")
        }
        
        return .ok(message: "密码验证成功")
    }
}
