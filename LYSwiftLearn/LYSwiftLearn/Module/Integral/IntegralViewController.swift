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
        
//        let p = Planet.venus
//        log.debug(p.rawValue)
//        let p1 = Planets.venus
//        log.debug(type(of: p1.rawValue))
//
//        let five = ArithmeticExpression.number(5)
//        let four = ArithmeticExpression.number(4)
//        let sum = ArithmeticExpression.addition(five, four)
//        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
//        log.debug(product)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        test2()
        
    }
    
    func test3(a: String...) {
        
    }
    
    func test2() {
        
    
        
    }
    
    func test1(){
        let observable = Observable<String>.create { (observer) -> Disposable in
            
            return Disposables.create {
                
            }
        }
        
        observable.subscribe(onNext: { (s) in
            
        }, onError: { (e) in
            
        }, onCompleted: {
            
        }) {
            
        }.dispose()
        
        
    }
}
