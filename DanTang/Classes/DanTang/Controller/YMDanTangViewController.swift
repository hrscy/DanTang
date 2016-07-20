//
//  YMDanTangViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/19.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  单糖
//

import UIKit

class YMDanTangViewController: YMBaseViewController, UIScrollViewDelegate {
    
    /// 首页列表数据
    var items = [YMHomeItem]()
    
    var channels = [YMChannel]()
    
    
    var contentView = UIScrollView()
    /// 当前选中的按钮
    var selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏
        setupNav()
        weak var weakSelf = self
        // 获取首页数据
        YMNetworkTool.shareNetworkTool.loadHomeInfo(4) { (homeItems) in
            weakSelf!.items = homeItems
            print(homeItems)
        }
        // 获取首页顶部选择数据
        YMNetworkTool.shareNetworkTool.loadHomeTopData { (ym_channels) in
            weakSelf!.channels = ym_channels
            
            //            print(ym_channels)
        }
        //设置顶部标签栏
        setupTitlesView()
        // 初始化子控制器
        setupChildViewControllers()
        // 底部的scrollview
        setupContentView()
        
        
    }
    
    /// 初始化子控制器
    func setupChildViewControllers() {
        for channel in channels {
            let vc = YMTopicViewController()
            vc.title = channel.name
            addChildViewController(vc)
        }
    }
    
    
    /// 顶部标签栏
    func setupTitlesView() {
        // 标签
        view.addSubview(titlesView)
        //底部红色指示器
        titlesView.addSubview(indicatorView)
        
        /// -------------- 布局 -------------
        titlesView.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(kTitlesViewY)
            make.width.equalTo(SCREENW)
            make.height.equalTo(kTitlesViewH)
        }
        
        //内部子标签
        let count = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count {
            let button = UIButton()
            button.height = height
            button.width = width
            button.x = CGFloat(index) * width
            button.tag = index
            let vc = childViewControllers[index]
            button.setTitle(vc.title, forState: .Normal)
            button.setTitleColor(UIColor.grayColor(), forState: .Normal)
            button.setTitleColor(YMGlobalRedColor(), forState: .Disabled)
            button.addTarget(self, action: #selector(titlesClick(_:)), forControlEvents: .TouchUpInside)
            titlesView.addSubview(button)
            //默认点击了第一个按钮
            if index == 0 {
                button.enabled = false
                selectedButton = button
                //让按钮内部的Label根据文字来计算内容
                button.titleLabel?.sizeToFit()
                indicatorView.centerX = button.centerX
            }
        }
        
        
        
        
    }
    
    func titlesClick(button: UIButton) {
        // 修改按钮状态
        selectedButton.enabled = true
        button.enabled = false
        selectedButton = button
        // 让标签执行动画
        UIView.animateWithDuration(kAnimationDuration) { 
            self.indicatorView.width = self.selectedButton.titleLabel!.width
            self.indicatorView.centerX = self.selectedButton.centerX
        }
        //滚动,切换子控制器
        var offset = contentView.contentOffset
        offset.x = CGFloat(button.tag) * contentView.width
        contentView.setContentOffset(offset, animated: true)
    }
    
    /// 标签
    private lazy var titlesView: UIView = {
        let titlesView = UIView()
        titlesView.backgroundColor = YMColor(1, g: 1, b: 1, a: 0.7)
        return titlesView
    }()
    
    //底部红色指示器
    private lazy var indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = YMGlobalRedColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.y = kTitlesViewH - kIndicatorViewH
        indicatorView.tag = -1
        return indicatorView
    }()
    
    // 内部子标签
//    private lazy var
    
    /// 底部的scrollview
    func setupContentView() {
        //不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.contentSize = CGSizeMake(contentView.width * CGFloat(childViewControllers.count), 0)
        contentView.pagingEnabled = true
        view.insertSubview(contentView, atIndex: 0)
        self.contentView = contentView
        //添加第一个控制器的view
        scrollViewDidEndScrollingAnimation(contentView)
    }
    
    /// 设置导航栏
    func setupNav() {
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(dantangRightBBClick))
    }

    func dantangRightBBClick() {
        print(#function)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        // 添加子控制器的 view
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 取出子控制器
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0 // 设置控制器的y值为0(默认为20)
        //设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 点击 Button
        print(index)
        
    }

}

