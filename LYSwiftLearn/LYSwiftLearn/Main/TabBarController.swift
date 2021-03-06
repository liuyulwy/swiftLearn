//
//  TabBarController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/10.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import ESTabBarController_swift
//import SwifterSwift
class TabBarController: ESTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configAppearance()
        let v1 = HomeViewController(viewModel: nil)
        let v2 = NewsViewController(viewModel: nil)
        let v3 = DataBaseViewController(viewModel: nil)
        let v4 = IntegralViewController(viewModel: nil)
        let v5 = MeViewController(viewModel: nil)
        
        v1.tabBarItem = ESTabBarItem.init(TabbarItemContentView.init(), title: "首页", image: R.image.tabbar_home_normal(), selectedImage: R.image.tabbar_home_selected())
        v2.tabBarItem = ESTabBarItem.init(TabbarItemContentView.init(), title: "资讯", image: R.image.tabbar_news_normal(), selectedImage: R.image.tabbar_news_selected())
        v3.tabBarItem = ESTabBarItem.init(TabbarItemCenterContentView(), title: nil, image: R.image.tabbar_database(), selectedImage: R.image.tabbar_database())
        v4.tabBarItem = ESTabBarItem.init(TabbarItemContentView.init(), title: "积分", image: R.image.tabbar_integral_normal(), selectedImage: R.image.tabbar_integral_selected())
        v5.tabBarItem = ESTabBarItem.init(TabbarItemContentView.init(), title: "我的", image: R.image.tabbar_me_normal(), selectedImage: R.image.tabbar_me_selected())
        
        let nav1 = BaseNavgationController.init(rootViewController: v1)
        nav1.navigationItem.title = "one"
        let nav2 = BaseNavgationController.init(rootViewController: v2)
        let nav3 = BaseNavgationController.init(rootViewController: v3)
        let nav4 = BaseNavgationController.init(rootViewController: v4)
        let nav5 = BaseNavgationController.init(rootViewController: v5)
        
        viewControllers = [nav1,nav2,nav3,nav4,nav5]
        
    }
    
    func configAppearance() {
        let appearance = UITabBar.appearance()
        appearance.backgroundColor = UIColor.white
        appearance.shadowImage = R.image.tapbar_top_line()
        appearance.backgroundImage = UIImage.init()
        appearance.barTintColor = UIColor.white
        appearance.isTranslucent = false
        
        let navAppearance = UINavigationBar.appearance()
//        navAppearance.backgroundColor = .white
//        navAppearance.barTintColor = .white
        navAppearance.shadowImage = R.image.transparent()
        navAppearance.setBackgroundImage(self.navBackgroundImage().withRenderingMode(.alwaysOriginal), for: .default)
//        navAppearance.tintColor = .red //UIBarButtonItem 颜色
//        navAppearance.barTintColor = .white
        navAppearance.isTranslucent = false

        navAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        navAppearance.backIndicatorImage = R.image.back()?.withRenderingMode(.alwaysOriginal)
        navAppearance.backIndicatorTransitionMaskImage = R.image.back()?.withRenderingMode(.alwaysOriginal)
        
        let itemAppearance = UIBarButtonItem.appearance()
        itemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        itemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .highlighted)
        
    }
    
    func navBackgroundImage() -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: 83)
        gradientLayer.colors = [UIColor.init(hexString: "#2A57ED")!.cgColor, UIColor.init(hexString: "#5332DB")!.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
    
}
//                tabBar.isTranslucent = false
//                if #available(iOS 13.0, *) {
//                    let appearance = UITabBarAppearance.init()
//                    appearance.configureWithDefaultBackground()
//                    appearance.shadowImage = R.image.transparent()
//                    appearance.backgroundColor = .white
////                    appearance.backgroundImage = R.image.tabbar_navbar()
//                    UITabBar.appearance().standardAppearance = appearance
//
//                } else {
////                    tabBar.shadowImage = UIImage.init()
////                    tabBar.backgroundColor = UIColor.white
////                    tabBar.shadowImage = R.image.transparent()
//                    let appearance = UITabBar.appearance()
//                    appearance.backgroundColor = UIColor.white
//                    appearance.shadowImage = R.image.transparent()
//                    appearance.backgroundImage = UIImage.init()
//                    appearance.barTintColor = UIColor.white
//                    appearance.isTranslucent = false
//                }
