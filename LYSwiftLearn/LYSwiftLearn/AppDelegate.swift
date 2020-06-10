//
//  AppDelegate.swift
//  LYSwiftLearn
//
//  Created by 刘宇 on 2020/4/4.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        return true
    }

}
