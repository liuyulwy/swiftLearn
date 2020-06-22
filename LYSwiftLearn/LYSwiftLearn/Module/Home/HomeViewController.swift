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
class HomeViewController: BaseViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        log.verbose("一条verbose级别消息：程序执行时最详细的信息。")
        log.debug("一条debug级别消息：用于代码调试。")
        log.info("一条info级别消息：常用与用户在console.app中查看。")
        log.warning("一条warning级别消息：警告消息，表示一个可能的错误。")
        log.error("一条error级别消息：表示产生了一个可恢复的错误，用于告知发生了什么事情。")
        log.severe("一条severe error级别消息：表示产生了一个严重错误。程序可能很快会奔溃。")
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
        let news = MeViewController.init()
        navigationController?.pushViewController(news, animated: true)
    }
    
}
