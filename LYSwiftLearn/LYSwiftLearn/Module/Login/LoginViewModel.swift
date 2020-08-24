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
        
    }

    func transform(input: Input) -> Output {
        
        
        
        
        return Output.init()
    }
}
