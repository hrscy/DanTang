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
        actionSheet.frame = UIScreen.main.bounds
        actionSheet.backgroundColor = YMColor(r: 0, g: 0, b: 0, a: 0.6)
        
        let window = UIApplication.shared.keyWindow
        window?.addSubview(actionSheet)
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
        // 分享到 标签
        topView.addSubview(shareLabel)
        // 6 个分享按钮的 view
        topView.addSubview(shareButtonView)
        
        topView.snp.makeConstraints { (make) in
            make.bottom.equalTo(cancelButton.snp.top).offset(-kMargin)
            make.left.equalTo(cancelButton.snp.left)
            make.right.equalTo(cancelButton.snp.right)
            make.height.equalTo(kTopViewH)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalTo(bgView).offset(kMargin)
            make.right.bottom.equalTo(bgView).offset(-kMargin)
            make.height.equalTo(44)
        }
        
        shareLabel.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(topView)
            make.height.equalTo(30)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        UIView.animate(withDuration: kAnimationDuration) {
            self.bgView.y = SCREENH - self.bgView.height
        }
    }
    
    // 底部 view
    private lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: SCREENH, width: SCREENW, height: 280)
        return bgView
    }()
    // 上部 view
    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.white
        topView.layer.cornerRadius = kCornerRadius
        topView.layer.masksToBounds = true
        return topView
    }()
    
    // 分享到标签
    private lazy var shareLabel: UILabel = {
        let shareLabel = UILabel()
        shareLabel.text = "分享到"
        shareLabel.textColor = YMColor(r: 0, g: 0, b: 0, a: 0.7)
        shareLabel.textAlignment = .center
        return shareLabel
    }()
    // 6个按钮
    private lazy var shareButtonView: YMShareButtonView = {
        let shareButtonView = YMShareButtonView()
        shareButtonView.frame = CGRect(x: 0, y: 30, width: SCREENW - 20, height: kTopViewH - 30)
        return shareButtonView
    }()
    
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelButton.setTitleColor(YMColor(r: 37, g: 142, b: 240, a: 1.0), for: .normal)
        cancelButton.backgroundColor = UIColor.white
        cancelButton.addTarget(self, action: #selector(cancelButtonClick), for: .touchUpInside)
        cancelButton.layer.cornerRadius = kCornerRadius
        cancelButton.layer.masksToBounds = true
        return cancelButton
    }()
    
    func cancelButtonClick() {
        UIView.animate(withDuration: kAnimationDuration, animations: {
            self.bgView.y = SCREENH
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: kAnimationDuration, animations: { 
            self.bgView.y = SCREENH
            }) { (_) in
                self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
