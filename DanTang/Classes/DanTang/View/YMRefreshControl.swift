//
//  YMRefreshControl.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/26.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

class YMRefreshControl: UIRefreshControl {
    /// 定义变量记录是否需要旋转监听
    private var rotationArrowFlag = false
    /// 定义变量记录当前是否正在执行圈圈动画
    private var loadingViewAnimationFlag = false
    
    override init() {
        super.init()
        
        setupUI()
    }
    
    private func setupUI() {
        // 添加刷新控件
        addSubview(refreshView)
        
        refreshView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(CGSize(width: 170, height: 60))
        }
        /*
         1.当用户下拉到一定程度的时候需要旋转箭头
         2.当用户上推到一定程度的时候需要旋转箭头
         3.当下拉刷新控件触发刷新方法的时候, 需要显示刷新界面(转轮)
         
         通过观察:
         越往下拉: 值就越小
         越往上推: 值就越大
         */
        addObserver(self, forKeyPath: "frame", options: .new, context: nil)
    }
    
    func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutableRawPointer) {
        // 过滤掉不需要的数据
        if frame.origin.y >= 0 {
            return
        }
        
        // 判断是否已经触发刷新事件
        if isRefreshing && !loadingViewAnimationFlag {
            // 执行动画
            loadingViewAnimationFlag = true
            
            refreshView.startLodingViewAnimation()
            return
        }
        
        if frame.origin.y >= -40 && rotationArrowFlag {
            // 旋转回原始位置
            rotationArrowFlag = false
            refreshView.rotationArrowIcon(flag: rotationArrowFlag)
        } else if frame.origin.y < -40 && !rotationArrowFlag {
            rotationArrowFlag = true
            refreshView.rotationArrowIcon(flag: rotationArrowFlag)
        }
        
    }
    
    /// 结束刷新
    override func endRefreshing() {
        super.endRefreshing()
        // 关闭圈圈动画
        refreshView.stopLodingViewAnimation()
        
        loadingViewAnimationFlag = false
    }
    
    // MARK: - 懒加载
    private lazy var refreshView: YMRefreshView = YMRefreshView.refreshView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
