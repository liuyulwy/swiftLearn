//
//  Constant.swift
//  LYSwiftLearn
//
//  Created by LY on 2020/6/19.
//  Copyright © 2020 liuyu. All rights reserved.
//

import Foundation
import UIKit

///MARK: 设备宽高
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
public let SCREEN_BOUNDS = UIScreen.main.bounds
public let SCREENMIN = min(SCREEN_WIDTH, SCREEN_HEIGHT)
public let SCREENMAX = max(SCREEN_WIDTH, SCREEN_HEIGHT)
/// 判断设备
public let IsIphoneX = UIScreen.main.bounds.size.height >= 812
/// 状态栏高度
public let STATUS_BAR_HEIGHT = UIApplication.shared.statusBarFrame.height
/// 导航栏高度获取
public let NAV_HEIGHT = (UIApplication.shared.statusBarFrame.height + 44 ) as CGFloat
///  TABBAR 高度获取
public let TAB_HEIGHT = (UIScreen.main.bounds.size.height >= 812 ? 83 : 49) as CGFloat
