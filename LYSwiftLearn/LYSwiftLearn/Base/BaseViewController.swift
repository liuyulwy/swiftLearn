//
//  BaseViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/10.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    //是否添加返回按钮
    var automaticallyAdjustsLeftBarButtonItem: Bool = true
    
    //导航标题
    var navigationTitle = "" {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    // 返回按钮
    lazy var backBarButton: UIBarButtonItem = {
        let item = UIBarButtonItem.init(title: "返回", style: .done, target: self, action: #selector(backAction))
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
    
    func makeUI() {
        
    }
    
    func bindViewModel() {
        
    }
    
    func adjustLeftBarButtonItem() {
        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            navigationItem.leftBarButtonItem = backBarButton
        }else {
            navigationItem.leftBarButtonItem = nil
        }
    }
    
    @objc func backAction() {
        let count = self.navigationController?.viewControllers.count ?? 0
        if count > 1 {
            navigationController?.popViewController(animated: true)
        }else{
            if presentingViewController != nil {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
