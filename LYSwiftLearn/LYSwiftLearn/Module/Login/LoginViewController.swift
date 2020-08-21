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
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBar.isTranslucent = false
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        let input = LoginViewModel.Input(userName: self.userNameTextField.rx.text.orEmpty.asDriver(),password: self.passworldTextField.rx.text.orEmpty.asDriver(),loginTap: self.loginButton.rx.tap.asSignal())
//        let output = LoginViewModel.transform(input)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let loginViewModel = LoginViewModel.init()
        navigator.show(segue: .login(viewModel: loginViewModel), sender: self, transition: .customModal(type: .push(direction: .up)))
    }
}
