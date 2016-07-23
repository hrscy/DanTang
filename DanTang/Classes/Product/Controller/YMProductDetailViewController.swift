//
//  YMProductDetailViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/21.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  单品详情
//

import UIKit
import SnapKit

class YMProductDetailViewController: YMBaseViewController, YMProductDetailToolBarDelegate {
    
    var product: YMProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNav()
    }
    
    /// 设置导航栏和底部栏
    func setupNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .Plain, target: self, action: #selector(shareBBItemClick))
        toolBarView.delegate = self
        view.addSubview(toolBarView)
        toolBarView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(45)
        }
    }
    
    func shareBBItemClick() {
        YMActionSheet.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var toolBarView: YMProductDetailToolBar = {
        let toolBarView = NSBundle.mainBundle().loadNibNamed(String(YMProductDetailToolBar), owner: nil
            , options: nil).last as! YMProductDetailToolBar
        return toolBarView
    }()
    
    func toolBarDidClickedTMALLButton() {
        let tmallVC = YMTMALLViewController()
        tmallVC.title = "商品详情"
        tmallVC.product = product
        let nav = YMNavigationController(rootViewController: tmallVC)
        presentViewController(nav, animated: true, completion: nil)
    }
}
