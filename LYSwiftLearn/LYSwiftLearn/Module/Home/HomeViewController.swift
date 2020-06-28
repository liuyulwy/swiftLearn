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

class HomeViewController: BaseViewController {
    
    let disposeBag = DisposeBag.init()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle = "home"
        view.backgroundColor = .white
        
        let view = UIView.init()
        //        view.backgroundColor = UIColor.blue
        view.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        self.view.addSubview(view)
        
        view.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.left.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                // Fallback on earlier versions
            }
            make.size.equalTo(CGSize.init(width: 200, height: 200))
        }
        
        
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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    
        //        let news = MeViewController.init()
        //        navigationController?.pushViewController(news, animated: true)
//        provider.rx.request(.playlist("152")).subscribe(onSuccess: { (respose) in
//            let json = try? respose.mapJSON()
////            log.debug(json)
//        }) { (err) in
////            log.debug(err)
//            }.disposed(by: disposeBag)
//        provider.request(.playlist("152")) { result in
//            switch result {
//            case let .success(response):
//                let statusCode = response.statusCode // 响应状态码：200, 401, 500...
//                let data = response.data // 响应数据
//                log.debug("statusCode:\(statusCode)==\(data)")
//                case let .failure(error):
//                    log.debug(error)
//                break
//
//            }
//
//        }
    }
    
}
