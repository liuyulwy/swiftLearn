//
//  ViewController.swift
//  LYSwiftLearn
//
//  Created by 刘宇 on 2020/4/4.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "hello world"
        view.backgroundColor = .white
    }

}

