//
//  AppDelegate.swift
//  LYSwiftLearn
//
//  Created by 刘宇 on 2020/4/4.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import XCGLogger

let log = XCGLogger.default


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let mainController = TabBarController()
        window?.rootViewController = mainController
        window?.makeKeyAndVisible()
        initThirdPart()
        return true
    }
    
    func initThirdPart() {
        let logCachePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let logUrl = logCachePath.appendingPathComponent("log.txt")
        switch UIApplication.shared.inferredEnvironment {
        case .debug, .testFlight:
            log.setup(level: .verbose, showLogIdentifier: true, showFunctionName: true, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, showDate: true, writeToFile: logUrl, fileLevel: .debug)
        case .appStore:
            log.setup(level: .severe, showLogIdentifier: true, showFunctionName: true, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, showDate: true, writeToFile: logUrl, fileLevel: .severe)
//            if let consoleLog = log.logAppDetails(selectedDestination: log as! DestinationProtocol) {
//                consoleLog.logQueue = XCGLogger.logQueue
//            }
        }
    }
    
}
