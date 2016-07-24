//
//  YMCategoryBottomView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/24.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

protocol YMCategoryBottomViewDelegate: NSObjectProtocol {
    func bottomViewButtonDidClicked(button: UIButton)
}

class YMCategoryBottomView: UIView {
    
    weak var delegate: YMCategoryBottomViewDelegate?
    
    var outGroups = [AnyObject]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// 分类界面 风格,品类
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadCategoryGroup { (outGroups) in
            weakSelf!.outGroups = outGroups
            weakSelf!.setupUI()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        
        let topGroups = outGroups[0]
        let bottomGroups = outGroups[1]
        let buttonW: CGFloat = SCREENW / 4
        let buttonH: CGFloat = buttonW
        let styleLabelH: CGFloat = 40
        // 风格
        let topView = UIView()
        topView.width = SCREENW
        topView.backgroundColor = UIColor.whiteColor()
        addSubview(topView)
        topView.addSubview(styleLabel)
        
        for index in 0..<topGroups.count {
            let group = topGroups[index] as! YMGroup
            let button = YMVerticalButton()
            button.width = buttonW
            button.height = buttonH
            button.x = buttonW * CGFloat(index % 4)
            button.y = buttonH * CGFloat(index / 4) + styleLabelH
            button.tag = group.id!
            button.addTarget(self, action: #selector(groupButonClick(_:)), forControlEvents: .TouchUpInside)
            button.titleLabel?.font = UIFont.systemFontOfSize(15)
            button.setTitleColor(YMColor(0, g: 0, b: 0, a: 0.6), forState: .Normal)
            button.kf_setImageWithURL(NSURL(string: group.icon_url!)!, forState: .Normal)
            button.setTitle(group.name, forState: .Normal)
            topView.addSubview(button)
            if index == topGroups.count - 1 {
                topView.height = CGRectGetMaxY(button.frame) + kMargin
            }
        }
        
        // 品类
        let bottomView = UIView()
        bottomView.width = topView.width
        bottomView.y = CGRectGetMaxY(topView.frame) + kMargin
        bottomView.backgroundColor = UIColor.whiteColor()
        addSubview(bottomView)
        bottomView.addSubview(categoryLabel)
        
        for index in 0..<bottomGroups.count {
            let group = bottomGroups[index] as! YMGroup
            let button = YMVerticalButton()
            button.width = buttonW
            button.height = buttonH
            button.x = buttonW * CGFloat(index % 4)
            button.y = buttonH * CGFloat(index / 4) + styleLabelH
            if index >= 3 {
                button.y = buttonH * CGFloat(index / 4) + styleLabelH + kMargin
            }
            button.tag = group.id!
            button.addTarget(self, action: #selector(groupButonClick(_:)), forControlEvents: .TouchUpInside)
            button.titleLabel?.font = UIFont.systemFontOfSize(15)
            button.setTitleColor(YMColor(0, g: 0, b: 0, a: 0.6), forState: .Normal)
            button.kf_setImageWithURL(NSURL(string: group.icon_url!)!, forState: .Normal)
            button.setTitle(group.name, forState: .Normal)
            bottomView.addSubview(button)
            if index == bottomGroups.count - 1 {
                bottomView.height = CGRectGetMaxY(button.frame) + kMargin
            }
        }
    }
    
    func groupButonClick(button: UIButton) {
        delegate?.bottomViewButtonDidClicked(button)
    }
    
    private lazy var styleLabel: UILabel = {
        let styleLabel = UILabel(frame: CGRectMake(10, 0, SCREENW - 10, 40))
        styleLabel.text = "风格"
        styleLabel.textColor = YMColor(0, g: 0, b: 0, a: 0.6)
        styleLabel.font = UIFont.systemFontOfSize(16)
        return styleLabel
    }()
    
    private lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel(frame: CGRectMake(10, 0, SCREENW - 10, 40))
        categoryLabel.text = "品类"
        categoryLabel.textColor = YMColor(0, g: 0, b: 0, a: 0.6)
        categoryLabel.font = UIFont.systemFontOfSize(16)
        return categoryLabel
    }()
}
