//
//  ViewModel.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/8/19.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

class ViewModel: NSObject {
  
}
