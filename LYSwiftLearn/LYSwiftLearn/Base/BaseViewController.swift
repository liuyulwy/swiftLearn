//
//  BaseViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/10.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import RxSwift


class BaseViewController: UIViewController{
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
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
    func updateUI() { }
    func bindViewModel() { }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
