//
//  BaseViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/10.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class BaseViewController: UIViewController, NVActivityIndicatorViewable{
  
    //导航标题
    var navigationTitle = "" {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    // 返回按钮
    lazy var backBarButton: UIBarButtonItem = {
        let item = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
        return item
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func makeUI() {
//        if #available(iOS 11.0, *) {
//            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
//        } else {
//            automaticallyAdjustsScrollViewInsets = false
//        }
        view.backgroundColor = .white
        navigationItem.backBarButtonItem = backBarButton
    }
    
    func bindViewModel() {
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
