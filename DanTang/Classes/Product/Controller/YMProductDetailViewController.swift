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
    
    var result: YMSearchResult?
    
    var type = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNav()
        
        
        
        
//        YMNetworkTool.shareNetworkTool.loadProductDetailData(product!.id!) { (productDetail) in
//            
//        }
        
    }
    
    
    /// 设置导航栏和底部栏
    func setupNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .Plain, target: self, action: #selector(shareBBItemClick))
        
        view.addSubview(scrollView)
        // 添加底部栏
        view.addSubview(toolBarView)
        topScrollView.product = product
        scrollView.addSubview(topScrollView)
        
        scrollView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(toolBarView.snp_top)
        }
        
        toolBarView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(45)
        }
        
        topScrollView.snp_makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(view.snp_top).offset(64)
            make.height.equalTo(520)
        }
        
    }
    
    /// 分享按钮点击
    func shareBBItemClick() {
        YMActionSheet.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 顶部滚动视图
    private lazy var topScrollView: YMProductDetailTopView = {
        let topScrollView = YMProductDetailTopView()
        topScrollView.backgroundColor = UIColor.whiteColor()
        return topScrollView
    }()
    
    /// scrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.cyanColor()
        return scrollView
    }()
    
    /// 底部栏
    private lazy var toolBarView: YMProductDetailToolBar = {
        let toolBarView = NSBundle.mainBundle().loadNibNamed(String(YMProductDetailToolBar), owner: nil
            , options: nil).last as! YMProductDetailToolBar
        toolBarView.delegate = self
        return toolBarView
    }()
    
    /// 底部栏按钮点击
    func toolBarDidClickedTMALLButton() {
        let tmallVC = YMTMALLViewController()
        tmallVC.title = "商品详情"
//        tmallVC.product = product
        let nav = YMNavigationController(rootViewController: tmallVC)
        presentViewController(nav, animated: true, completion: nil)
    }
}

