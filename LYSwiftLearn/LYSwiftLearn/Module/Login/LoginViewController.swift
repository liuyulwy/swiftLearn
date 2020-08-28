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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func makeUI() {
   
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        guard let viewModel = self.viewModel as? LoginViewModel else { return }
        let input = LoginViewModel.Input( userName: self.userNameTextField.rx.text.orEmpty.asDriver(), password: self.passworldTextField.rx.text.orEmpty.asDriver(), loginTap: self.loginButton.rx.tap.asSignal() )
        let output = viewModel.transform(input: input)
        
        output.signupEnable.drive(onNext: { [weak self] (enable) in
            self?.loginButton.isEnabled = enable
            self?.loginButton.alpha = enable ? 1.0 : 0.5
        })
        .disposed(by: disposeBag)
        
        output.validatedUserName.drive(onNext: { (result) in
            switch result {
            case .ok:
                self.userNameTextField.superview?.layer.borderColor = UIColor.lightGray.cgColor
            default:
                self.userNameTextField.superview?.layer.borderColor = UIColor.red.cgColor
            }
        })
        .disposed(by: disposeBag)
        
        output.validatedPassword.drive(onNext: { (result) in
            switch result {
            case .ok:
                self.passworldTextField.superview?.layer.borderColor = UIColor.lightGray.cgColor
            default:
                self.passworldTextField.superview?.layer.borderColor = UIColor.red.cgColor
            }
        })
        .disposed(by: disposeBag)
        
        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
}
