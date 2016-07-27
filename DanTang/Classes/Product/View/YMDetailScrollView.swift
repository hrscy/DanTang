//
//  YMDetailScrollView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/27.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMDetailScrollView: UIScrollView {
    
    var product: YMProduct? {
        didSet {
            topScrollView.product = product
            bottomScrollView.product = product
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        
        addSubview(topScrollView)
        // 添加底部滚动视图
        addSubview(bottomScrollView)
        
        topScrollView.snp_makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.size.equalTo(CGSizeMake(SCREENW, 520))
        }
        
        bottomScrollView.snp_makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(topScrollView.snp_bottom).offset(kMargin)
            make.size.equalTo(CGSizeMake(SCREENW, SCREENH - 64 - 45))
        }
    }
    
    /// 顶部滚动视图
    private lazy var topScrollView: YMProductDetailTopView = {
        let topScrollView = YMProductDetailTopView()
        topScrollView.backgroundColor = UIColor.whiteColor()
        return topScrollView
    }()
    
    /// 底部滚动视图
    private lazy var bottomScrollView: YMProductDetailBottomView = {
        let bottomScrollView = YMProductDetailBottomView()
        bottomScrollView.backgroundColor = UIColor.whiteColor()
        return bottomScrollView
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
