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
import CryptoSwift
import Toaster

class LoginViewModel: ViewModel, ViewModelType {
    
    struct Input {
        let userName: Driver<String>
        let password: Driver<String>
        let loginTap: Driver<Void>
    }
    struct Output {
        let validatedUserName: Driver<ValidationResult>
        let validatedPassword: Driver<ValidationResult>
        let signingIn: Driver<Bool>
        let signupEnable: Driver<Bool>
        let signedIn: Driver<ResponseObjectData<LoginInfoModel>>
    }

    func transform(input: Input) -> Output {
        
        let validatedUserName = input.userName.map { LoginValidationService.default.validateUserName(userName: $0) }
        
        let validatedPassword = input.password.map { LoginValidationService.default.validatePassword(passworld: $0) }
        
        let signingIn = ActivityIndicator()
        
        let signupEnable = Driver.combineLatest(validatedUserName, validatedPassword, signingIn) { (userName, password, signingIn) in
            return userName.isValid && password.isValid && !signingIn
        }.distinctUntilChanged()
        
        let up = Driver.combineLatest(input.userName, input.password) {($0, $1)}
        
        let signedIn = input.loginTap.withLatestFrom(up).flatMap { (name,pwd) -> Driver<ResponseObjectData<LoginInfoModel>> in
            return RestApi.defualt.login(name: name, pwd: pwd.md5()).trackActivity(signingIn).trackError(self.error).asDriver { (error) -> Driver<ResponseObjectData<LoginInfoModel>> in
                if let e = error as? NetworkError {
                    Toast.init(text: e.msg).show()
                }
                return Driver.empty()
            }
        }.flatMap({ (result) -> Driver<ResponseObjectData<LoginInfoModel>> in
            Toast.init(text: result.msg).show()
            return Driver.just(result)
        })
        
        return Output.init(validatedUserName: validatedUserName, validatedPassword: validatedPassword, signingIn: signingIn.asDriver(), signupEnable: signupEnable ,signedIn: signedIn)
    }
}
