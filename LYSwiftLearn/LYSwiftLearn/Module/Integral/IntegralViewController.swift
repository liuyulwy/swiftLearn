//
//  IntegralViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/17.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle = "integral"
        
        let p = Planet.venus
        log.debug(p.rawValue)
        let p1 = Planets.venus
        log.debug(type(of: p1.rawValue))
        
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        log.debug(product)
    }
    

    

}
