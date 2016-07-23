//
//  YMActionSheet.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/23.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

class YMActionSheet: UIView {
    
    class func show() {
        let actionSheet = YMActionSheet()
        actionSheet.frame = UIScreen.mainScreen().bounds
        actionSheet.backgroundColor = YMColor(0, g: 0, b: 0, a: 0.6)
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(actionSheet)
//        print(actionSheet.bgView)
//        UIView.animateWithDuration(5) { 
//            actionSheet.bgView.y = 100
//            actionSheet.layoutIfNeeded()
//        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI() {
        
        addSubview(bgView)
        
        // 上部 分享界面
        bgView.addSubview(topView)
        // 下部取消按钮
        bgView.addSubview(cancelButton)
        
        topView.addSubview(shareLabel)
        
        bgView.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
//            make.top.equalTo(self.snp_bottom)
            make.height.equalTo(320)
        }
        
        topView.snp_makeConstraints { (make) in
            make.bottom.equalTo(cancelButton.snp_top).offset(-15)
            make.left.equalTo(cancelButton.snp_left)
            make.right.equalTo(cancelButton.snp_right)
            make.height.equalTo(210)
        }
        
        cancelButton.snp_makeConstraints { (make) in
            make.left.equalTo(bgView).offset(15)
            make.right.bottom.equalTo(bgView).offset(-15)
            make.height.equalTo(44)
        }
        
        shareLabel.snp_makeConstraints { (make) in
            make.left.right.top.equalTo(topView)
            make.height.equalTo(40)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.redColor()
        return bgView
    }()
    
    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.whiteColor()
        topView.layer.cornerRadius = kCornerRadius
        topView.layer.masksToBounds = true
        return topView
    }()
    
    private lazy var shareLabel: UILabel = {
        let shareLabel = UILabel()
        shareLabel.text = "分享到"
        shareLabel.backgroundColor = UIColor.cyanColor()
        shareLabel.textColor = YMColor(0, g: 0, b: 0, a: 0.7)
        shareLabel.textAlignment = .Center
        return shareLabel
    }()
    
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("取消", forState: .Normal)
        cancelButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        cancelButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        cancelButton.backgroundColor = UIColor.whiteColor()
        cancelButton.layer.cornerRadius = kCornerRadius
        cancelButton.layer.masksToBounds = true
        return cancelButton
    }()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.removeFromSuperview()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
