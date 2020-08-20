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
    var viewModel: ViewModel?
    var navigator: Navigator!
    var automaticallyAdjustsLeftBarButtonItem = true
    let disposeBag = DisposeBag()
    init(viewModel: ViewModel?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.navigator = Navigator.defualt
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //导航标题
    var navigationTitle = "" {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    // 返回按钮
    lazy var backBarButton: UIBarButtonItem = {
        let item = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        return item
    }()
    
    // 关闭按钮
    lazy var closeBarButton: UIBarButtonItem = {
        let item = UIBarButtonItem.init(title: "关闭", style: .done, target: nil, action: nil)
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if automaticallyAdjustsLeftBarButtonItem {
            adjustLeftBarButtonItem()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }
    
    func makeUI() {
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        view.backgroundColor = .white
        navigationItem.backBarButtonItem = backBarButton
    }
    
    func updateUI() {}
    
    func bindViewModel() {
        closeBarButton.rx.tap.subscribe { [weak self] (event) in
            self?.navigator.dismiss(sender: self)
        }.disposed(by: disposeBag)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func adjustLeftBarButtonItem() {
        if self.navigationController?.viewControllers.count ?? 0 > 1 { // Pushed
            self.navigationItem.leftBarButtonItem = nil
        } else if self.presentingViewController != nil { // presented
            self.navigationItem.leftBarButtonItem = closeBarButton
        }
    }
    
    
}
