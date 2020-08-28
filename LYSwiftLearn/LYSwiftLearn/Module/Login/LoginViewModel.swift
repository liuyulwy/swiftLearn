//
//  LoginViewModel.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/8/19.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel: ViewModel, ViewModelType {
    
    struct Input {
        let userName: Driver<String>
        let password: Driver<String>
        let loginTap: Signal<()>
    }
    struct Output {
        let validatedUserName: Driver<ValidationResult>
        let validatedPassword: Driver<ValidationResult>
        let signingIn: Driver<Bool>
        let signupEnable: Driver<Bool>
    }

    func transform(input: Input) -> Output {
        
        let validatedUserName = input.userName.map { LoginValidationService.default.validateUserName(userName: $0) }
        let validatedPassword = input.password.map { LoginValidationService.default.validatePassword(passworld: $0) }
        let signingIn = ActivityIndicator().asDriver()
        let signupEnable = Driver.combineLatest(validatedUserName, validatedPassword, signingIn) { (userName, password, signingIn) in
            return userName.isValid && password.isValid && !signingIn
        }.distinctUntilChanged()
        let usernameAndPassword = Driver.combineLatest(input.userName, input.password) { (username: $0, password: $1) }
       
        
        
        return Output.init(validatedUserName: validatedUserName, validatedPassword: validatedPassword, signingIn: signingIn, signupEnable: signupEnable)
    }
}
