//
//  BaseNavgationController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/10.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit

class BaseNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false

    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
