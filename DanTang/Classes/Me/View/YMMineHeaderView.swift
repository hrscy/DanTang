//
//  YMMineHeaderView.swift
//  YMMineHeaderView
//  DanTang
//
//  Created by 杨蒙 on 16/7/23.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

class YMMineHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 初始化UI
        setupUI()
    }
    
    private func setupUI() {
        /// 添加子控件
        addSubview(bgImageView)
        addSubview(settingButton)
        addSubview(messageButton)
        addSubview(iconButton)
        addSubview(nameLabel)
        
        // 布局
        bgImageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.top.equalTo(-20)
        }
        
        settingButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 44, height: 44))
            make.right.equalTo(self)
            make.top.equalTo(0)
        }
        
        messageButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 44, height: 44))
            make.left.equalTo(self)
            make.top.equalTo(settingButton.snp.top)
        }
        
        iconButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(SCREENW * 0.5)
            make.size.equalTo(CGSize(width: 75, height: 75))
            make.bottom.equalTo(nameLabel.snp.top).offset(-kMargin)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-3 * kMargin)
            make.left.right.equalTo(self)
            make.height.equalTo(2 * kMargin)
        }
        
    }
    
    /// 懒加载，创建背景图片
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.image = UIImage(named: "Me_ProfileBackground")
        return bgImageView
    }()
    
    /// 懒加载，创建左上角消息按钮
    lazy var messageButton: UIButton = {
        let messageButton = UIButton()
        messageButton.setImage(UIImage(named: "Me_message_20x20_"), for: .normal)
        return messageButton
    }()
    
    /// 懒加载，创建左上角消息按钮
    lazy var settingButton: UIButton = {
        let settingButton = UIButton()
        settingButton.setImage(UIImage(named: "Me_settings_20x20_"), for: .normal)
        return settingButton
    }()
    
    /// 懒加载，创建头像按钮
    lazy var iconButton: UIButton = {
        let iconButton = UIButton()
        iconButton.setBackgroundImage(UIImage(named: "Me_AvatarPlaceholder_75x75_"), for: .normal)
        iconButton.layer.cornerRadius = iconButton.width * 0.5
        iconButton.layer.masksToBounds = true
        return iconButton
    }()
    
    /// 懒加载，创建昵称标签
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "hrscy"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 15.0)
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
