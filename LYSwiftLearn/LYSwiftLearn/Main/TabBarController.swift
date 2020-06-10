//
//  TabBarController.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/10.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class TabBarController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        
        let v1 = ViewController()
        let v2 = ViewController()
        let v3 = ViewController()
        let v4 = ViewController()
        let v5 = ViewController()
        v1.tabBarItem = ESTabBarItem.init(ExampleTipsBasicContentView(), title: "Home", image: R.image.tabbar_home_normal(), selectedImage: R.image.tabbar_home_selected())
        v2.tabBarItem = ESTabBarItem.init(ExampleTipsBasicContentView(), title: "Find", image: R.image.tabbar_news_normal(), selectedImage: R.image.tabbar_news_selected())
        v3.tabBarItem = ESTabBarItem.init(ExampleTipsBasicContentView(), title: "Photo", image: R.image.tabbar_database(), selectedImage: R.image.tabbar_database())
        v4.tabBarItem = ESTabBarItem.init(ExampleTipsBasicContentView(), title: "Favor", image: R.image.tabbar_integral_normal(), selectedImage: R.image.tabbar_integral_selected())
        v5.tabBarItem = ESTabBarItem.init(ExampleTipsContentView(), title: "Me", image: R.image.tabbar_news_normal(), selectedImage: R.image.tabbar_me_selected())
        
        let nav1 = BaseNavgationController.init(rootViewController: v1)
        let nav2 = BaseNavgationController.init(rootViewController: v2)
        let nav3 = BaseNavgationController.init(rootViewController: v3)
        let nav4 = BaseNavgationController.init(rootViewController: v4)
        let nav5 = BaseNavgationController.init(rootViewController: v5)
        
        viewControllers = [nav1,nav2,nav3,nav4,nav5]
       
    }
    


}
