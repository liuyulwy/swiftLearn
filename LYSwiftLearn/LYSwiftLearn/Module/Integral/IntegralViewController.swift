//
//  IntegralViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/17.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import SnapKit
import XCGLogger
import Moya
import RxCocoa
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum Planets: String {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
class IntegralViewController: BaseViewController {
    let disposeBag = DisposeBag.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle = "integral"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
