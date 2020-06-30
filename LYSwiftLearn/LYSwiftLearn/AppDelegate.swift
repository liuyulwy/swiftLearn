//
//  AppDelegate.swift
//  LYSwiftLearn
//
//  Created by 刘宇 on 2020/4/4.
//  Copyright © 2020 liuyu. All rights reserved.
//

import UIKit
import XCGLogger

let log: XCGLogger = {
    let log = XCGLogger.init(identifier: "advancedLogger", includeDefaultDestinations: false)
    //控制台打印设置
    let systemDestination = AppleSystemLogDestination(identifier: "advancedLogger.appleSystemLogDestination")
    systemDestination.outputLevel = .debug
    systemDestination.showLogIdentifier = false
    systemDestination.showFunctionName = true
    systemDestination.showThreadName = true
    systemDestination.showLevel = true
    systemDestination.showFileName = true
    systemDestination.showLineNumber = true
    systemDestination.showDate = true
    log.add(destination: systemDestination)
    
    //日志地址
    let logPath: URL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("log.txt")
    //日志超过大小存储地址
    let archiveFolderURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("log")
    //日志存储设置
    let autoRotatingFileDestination = AutoRotatingFileDestination.init(writeToFile: logPath, identifier: "advancedLogger.fileDestination", shouldAppend: true, attributes: [.protectionKey:FileProtectionType.completeUntilFirstUserAuthentication], maxFileSize: 1024 * 3, maxTimeInterval: 60,targetMaxLogFiles: 10)
    autoRotatingFileDestination.archiveFolderURL = archiveFolderURL
    autoRotatingFileDestination.outputLevel = .debug
    autoRotatingFileDestination.showLogIdentifier = false
    autoRotatingFileDestination.showFunctionName = true
    autoRotatingFileDestination.showThreadName = true
    autoRotatingFileDestination.showLevel = true
    autoRotatingFileDestination.showFileName = true
    autoRotatingFileDestination.showLineNumber = true
    autoRotatingFileDestination.showDate = true
    autoRotatingFileDestination.logQueue = XCGLogger.logQueue
    log.add(destination: autoRotatingFileDestination)
    //转存回调
    autoRotatingFileDestination.autoRotationCompletion = { sucess in
        if sucess {
//            print("====:\(autoRotatingFileDestination.archivedFileURLs())")
        }
    }
 
    //设置 outputLevel
    switch UIApplication.shared.inferredEnvironment {
    case .debug:
        systemDestination.outputLevel = .verbose
        autoRotatingFileDestination.outputLevel = .error
    default:
        systemDestination.outputLevel = .severe
        autoRotatingFileDestination.outputLevel = .severe
    }
    log.logAppDetails()
    //设置前后缀
    let emojiLogFormatter = PrePostFixLogFormatter()
    emojiLogFormatter.apply(prefix: "🗯🗯🗯 ", postfix: " 🗯🗯🗯", to: .verbose)
    emojiLogFormatter.apply(prefix: "🔹🔹🔹 ", postfix: " 🔹🔹🔹", to: .debug)
    emojiLogFormatter.apply(prefix: "ℹ️ℹ️ℹ️ ", postfix: " ℹ️ℹ️ℹ️", to: .info)
    emojiLogFormatter.apply(prefix: "✳️✳️✳️ ", postfix: " ✳️✳️✳️", to: .notice)
    emojiLogFormatter.apply(prefix: "⚠️⚠️⚠️ ", postfix: " ⚠️⚠️⚠️", to: .warning)
    emojiLogFormatter.apply(prefix: "‼️‼️‼️ ", postfix: " ‼️‼️‼️", to: .error)
    emojiLogFormatter.apply(prefix: "💣💣💣 ", postfix: " 💣💣💣", to: .severe)
    emojiLogFormatter.apply(prefix: "🛑🛑🛑 ", postfix: " 🛑🛑🛑", to: .alert)
    emojiLogFormatter.apply(prefix: "🚨🚨🚨 ", postfix: " 🚨🚨🚨", to: .emergency)
    log.formatters = [emojiLogFormatter]
    
    return log
}()

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
        
        NetworkStatusManager.sharedManager.startNetworkReachabilityObserver()
       
        return true
    }
}
