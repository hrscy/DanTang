//
//  YMSearchRecord.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/26.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  在搜索界面，显示 大家都在搜 和 历史纪录 的 view
//

import UIKit

class YMSearchRecordView: UIView {
    /// 关键词
    var words = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /// 搜索界面数据获取热搜关键词
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadHotWords { (hot_words) in
            weakSelf!.words = hot_words
            weakSelf!.setupUI()
        }
    }
    
    func setupUI() {
        
        // 大家都在搜
        let topView = UIView()
        addSubview(topView)
        let hotLabel = setupLabel(title: "大家都在搜")
        hotLabel.frame = CGRect(x: 10, y: 20, width: 200, height: 20)
        topView.addSubview(hotLabel)
        
        
        // 历史纪录
        let bottomView = UIView()
        
        addSubview(bottomView)
    }
    
    
    
    func setupLabel(title: String) -> UILabel{
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = YMColor(r: 0, g: 0, b: 0, a: 0.6)
        return label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
