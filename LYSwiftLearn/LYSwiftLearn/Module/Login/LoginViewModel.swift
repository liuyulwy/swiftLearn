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
        let signingIn = ActivityIndicator()
        let signupEnable = Driver.combineLatest(validatedUserName, validatedPassword, signingIn) { (userName, password, signingIn) in
            return userName.isValid && password.isValid && !signingIn
        }.distinctUntilChanged()
        let usernameAndPassword = Driver.combineLatest(input.userName, input.password) { (username: $0, password: $1) }
        let signedIn = input.loginTap.withLatestFrom(usernameAndPassword).flatMapLatest { (_)  in
            return serverApi.requetModel(.databaseNav, ResponseArrayData<NavItems>.self).trackActivity(signingIn).asDriver(onErrorJustReturn: ResponseArrayData.init())

        }.drive(onNext: { (items: ResponseArrayData<NavItems>) in
            print(items.data ?? "")
            })
        
        
        
        return Output.init(validatedUserName: validatedUserName, validatedPassword: validatedPassword, signingIn: signingIn.asDriver(), signupEnable: signupEnable)
    }
}
