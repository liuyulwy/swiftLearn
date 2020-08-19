//
//  HomeViewController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/17.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import SnapKit
import XCGLogger
import Moya
import RxCocoa
import SkeletonView
class HomeViewController: BaseViewController {
    let loading = ActivityIndicator()
    let disposeBag = DisposeBag.init()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self.navigationController?.navigationBar.isTranslucent as Any)
        print(self.view.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle = "home"
        view.backgroundColor = .red
        
        //        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "hello", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: R.image.tabbar_me_normal(), style: .plain, target: self, action: nil)
        //        self.edgesForExtendedLayout = .bottom
        //        self.extendedLayoutIncludesOpaqueBars = true
        let view = UIButton.init()
        //        view.backgroundColor = UIColor.blue
        view.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        self.view.addSubview(view)
        
        //        view.snp.makeConstraints { (make) in
        //            if #available(iOS 11.0, *) {
        //                make.top.left.equalTo(self.view.safeAreaLayoutGuide)
        //            } else {
        //                // Fallback on earlier versions
        //            }
        //            make.size.equalTo(CGSize.init(width: 200, height: 200))
        //        }
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        view.layer.addSublayer(gradientLayer)
        
        
        
        
        let view1 = UIView.init()
        view1.backgroundColor = UIColor.blue
        self.view.addSubview(view1)
        
        view1.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                //                make.bottom.left.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                // Fallback on earlier versions
                
            }
            make.bottom.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        
        print(self.view.frame.size.height)
        view.isSkeletonable = true
        view1.isSkeletonable = true
        self.view.showAnimatedSkeleton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        startAnimating()
//        serverApi.requet(.databaseNav, ReturnArrayData<NavItems>.self).trackActivity(loading).asObservable().subscribe(onNext: { (res) in
//
//        }, onError: { (err) in
//
//        }, onCompleted: {
//            self.stopAnimating()
//        }) {
//
//        }.disposed(by: disposeBag)
        
        let login = LoginViewController()
        login.modalPresentationStyle = .fullScreen
        self.present(login, animated: true, completion: nil)
    
    }
    
}
