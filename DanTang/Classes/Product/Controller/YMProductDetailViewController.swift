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
        
        setupUI()
    }
    
    
    /// 设置导航栏和底部栏
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(shareBBItemClick))
        
        view.addSubview(scrollView)
        // 添加底部栏
        view.addSubview(toolBarView)
        scrollView.product = product
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(toolBarView.snp.top)
        }
        
        toolBarView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(45)
        }
        
        scrollView.contentSize = CGSize(width: SCREENW, height: SCREENH - 64 - 45 + kMargin + 520)
    }
    
    /// 分享按钮点击
    func shareBBItemClick() {
        YMActionSheet.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// scrollView
    private lazy var scrollView: YMDetailScrollView = {
        let scrollView = YMDetailScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    /// 底部栏
    private lazy var toolBarView: YMProductDetailToolBar = {
        let toolBarView = Bundle.main.loadNibNamed(String(describing: YMProductDetailToolBar.self), owner: nil
            , options: nil)?.last as! YMProductDetailToolBar
        toolBarView.delegate = self
        return toolBarView
    }()
    
    /// 底部栏按钮点击
    func toolBarDidClickedTMALLButton() {
        let tmallVC = YMTMALLViewController()
        tmallVC.title = "商品详情"
        tmallVC.product = product
        let nav = YMNavigationController(rootViewController: tmallVC)
        present(nav, animated: true, completion: nil)
    }
}

extension YMProductDetailViewController: UIScrollViewDelegate {
    private func scrollViewDidScroll(scrollView: UIScrollView) {
        var offsetY = scrollView.contentOffset.y
        if offsetY >= 465 {
            offsetY = CGFloat(465)
            scrollView.contentOffset = CGPoint(x: 0, y: offsetY)
        }
    }
}

