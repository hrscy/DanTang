//
//  YMConst.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//
import UIKit

/// 服务器地址
let BASE_URL = "http://api.dantangapp.com/"

/// 第一次启动
let YMFirstLaunch = "firstLaunch"

/// code 码 200 操作成功
let RETURN_OK = 200
/// 间距
let kMargin: CGFloat = 10.0
/// 圆角
let kCornerRadius: CGFloat = 5.0
/// 线宽
let klineWidth: CGFloat = 1.0
/// 首页顶部标签指示条的高度
let kIndicatorViewH: CGFloat = 2.0
/// 新特性界面图片数量
let kNewFeatureCount = 5
/// 顶部标题的高度
let kTitlesViewH: CGFloat = 35
/// 顶部标题的y
let kTitlesViewY: CGFloat = 64
/// 动画时长
let kAnimationDuration = 0.25
/// 屏幕的宽
let SCREENW = UIScreen.mainScreen().bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.mainScreen().bounds.size.height

/// RGBA的颜色设置
func YMColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

/// 背景灰色
func YMGlobalColor() -> UIColor {
    return YMColor(245, g: 245, b: 245, a: 1)
}

/// 红色
func YMGlobalRedColor() -> UIColor {
    return YMColor(245, g: 80, b: 83, a: 1.0)
}

/// iPhone 5
let isIPhone5 = SCREENH == 568 ? true : false
/// iPhone 6
let isIPhone6 = SCREENH == 667 ? true : false
/// iPhone 6P
let isIPhone6P = SCREENH == 736 ? true : false