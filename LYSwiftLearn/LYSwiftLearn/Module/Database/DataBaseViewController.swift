//
//  DataBaseViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/17.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit

class DataBaseViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle = "database"
        view.backgroundColor = .red
        
        let view = UIView.init()
        view.backgroundColor = UIColor.blue
        view.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        self.view.addSubview(view)
        
        view.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
//                make.top.left.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                // Fallback on earlier versions
            }
             make.top.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
    }
   

}
