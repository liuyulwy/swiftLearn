//
//  LoginViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/8/19.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passworldTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        let input = LoginViewModel.Input(userName: self.userNameTextField.rx.text.orEmpty.asDriver(),password: self.passworldTextField.rx.text.orEmpty.asDriver(),loginTap: self.loginButton.rx.tap.asSignal())
        let output = LoginViewModel.transform(input)
        
    }
    
}
