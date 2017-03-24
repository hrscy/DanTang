//
//  YMTabBarController.swift
//  DanTang
//
//  Created by 杨蒙 on 2017/3/24.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class YMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = YMColor(r: 245, g: 90, b: 93, a: 1/0)
        addChildViewControllers()
    }
    
    /**
     * 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childController: YMDanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
        addChildViewController(childController: YMProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
        addChildViewController(childController: YMCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewController(childController: YMMeViewController(), title: "我的", imageName: "TabBar_me_boy_23x23_")
    }
    
    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        childController.title = title
        let navC = YMNavigationController(rootViewController: childController)
        addChildViewController(navC)
    }
}
