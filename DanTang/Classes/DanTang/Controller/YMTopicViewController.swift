//
//  YMTopicViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMTopicViewController: YMBaseViewController {

    /// 首页列表数据
    var items = [YMHomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YMGlobalColor()
        // 获取首页数据
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadHomeInfo(4) { (homeItems) in
            weakSelf!.items = homeItems
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
