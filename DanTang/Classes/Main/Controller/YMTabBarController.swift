//
//  YMTabBarController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/19.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        // 添加子控制器
        addChildViewControllers()
    }
    
    /**
     # 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController("YMDanTangViewController", title: "单糖", imageName: "TabBar_home_23x23_")
        addChildViewController("YMProductViewController", title: "单品", imageName: "TabBar_gift_23x23_")
        addChildViewController("YMCategoryViewController", title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewController("YMMeViewController", title: "我", imageName: "TabBar_me_boy_23x23_")
    }
    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        // 动态获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        // 将字符串转化为类，默认情况下命名空间就是项目名称，但是命名空间可以修改
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = YMNavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }

}
