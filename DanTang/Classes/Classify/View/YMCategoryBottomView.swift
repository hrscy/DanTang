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
        let topGroups = outGroups[0] as! NSArray
        let bottomGroups = outGroups[1] as! NSArray
        
        // 风格
        let topView = UIView()
        topView.width = SCREENW
        topView.backgroundColor = UIColor.white
        addSubview(topView)
        let styleLabel = setupLabel(title: "风格")
        topView.addSubview(styleLabel)
        
        for index in 0..<topGroups.count {
            let group = topGroups[index] as! YMGroup
            let button = setupButton(index: index, group: group)
            topView.addSubview(button)
            if index == topGroups.count - 1 {
                topView.height = button.frame.maxY + kMargin
            }
        }
        
        // 品类
        let bottomView = UIView()
        bottomView.width = SCREENW
        bottomView.y = topView.frame.maxY + kMargin
        bottomView.backgroundColor = UIColor.white
        addSubview(bottomView)
        let categoryLabel = setupLabel(title: "品类")
        bottomView.addSubview(categoryLabel)
        
        for index in 0..<bottomGroups.count {
            let group = bottomGroups[index] as! YMGroup
            let button = setupButton(index: index, group: group)
            bottomView.addSubview(button)
            if index == bottomGroups.count - 1 {
                bottomView.height = button.frame.maxY + kMargin
            }
        }
    }
    
    private func setupButton(index: Int, group: YMGroup) -> YMVerticalButton{
        let buttonW: CGFloat = SCREENW / 4
        let buttonH: CGFloat = buttonW
        let styleLabelH: CGFloat = 40
        
        let button = YMVerticalButton()
        button.width = buttonW
        button.height = buttonH
        button.x = buttonW * CGFloat(index % 4)
        button.y = buttonH * CGFloat(index / 4) + styleLabelH
        if index > 3 {
            button.y = buttonH * CGFloat(index / 4) + styleLabelH + kMargin
        }
        button.tag = group.id!
        button.addTarget(self, action: #selector(groupButonClick), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(YMColor(r: 0, g: 0, b: 0, a: 0.6), for: .normal)
        button.kf.setImage(with: URL(string: group.icon_url!)!, for: .normal)
        button.setTitle(group.name, for: .normal)
        return button
    }
    
    func groupButonClick(button: UIButton) {
        print(button.tag)
        delegate?.bottomViewButtonDidClicked(button: button)
    }
    
    private func setupLabel(title: String) -> UILabel {
        let styleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: SCREENW - 10, height: 40))
        styleLabel.text = title
        styleLabel.textColor = YMColor(r: 0, g: 0, b: 0, a: 0.6)
        styleLabel.font = UIFont.systemFont(ofSize: 16)
        return styleLabel
    }
}
