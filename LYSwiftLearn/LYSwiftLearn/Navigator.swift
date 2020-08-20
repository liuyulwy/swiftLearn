//
//  Navigator.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/8/20.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import UIKit

class Navigator {
    static let `defualt` = Navigator()
    private init() {}
    
    enum Scene {
        case login(viewModel: LoginViewModel)
    }
    
    enum Transition {
        case modal
        case navigation
    }
    
    func getTarget(segue: Scene) -> UIViewController? {
        switch segue {
        case .login(viewModel: let viewModel): return LoginViewController.init(viewModel: viewModel)
            
        }
    }
    
    func show(segue: Scene, sender: UIViewController?, transition: Transition = .modal) {
        if let target = getTarget(segue: segue) {
            show(target: target, sender: sender, transition: transition)
        }
    }
    
    func dismiss(sender: UIViewController?) {
        sender?.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        
        guard let sender = sender else {
            fatalError("You need to pass in a sender for .navigation or .modal transitions")
        }
        
        if let nav = sender as? UINavigationController {
            nav.pushViewController(target, animated: false)
        }
        
        switch transition {
        case .modal:
            let nav = BaseNavgationController(rootViewController: target)
            nav.modalPresentationStyle = .fullScreen
            sender.present(nav, animated: true, completion: nil)
        case .navigation:
            if let nav = sender.navigationController {
                nav.pushViewController(target, animated: true)
            }
        }
        
    }
}
