//
//  YMTitlesView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

class YMTitlesView: UIView {

    var indicatorView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = YMColor(1, g: 1, b: 1, a: 0.7)
        
        //底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = YMColor(245, g: 80, b: 83, a: 1.0)
        indicatorView.tag = -1
        addSubview(indicatorView)
        self.indicatorView = indicatorView
        
        //内部子标签
        let count = Int()
        
        
        //默认点击了第一个按钮
        
        
        /// -------------- 布局 -------------
        indicatorView.snp_makeConstraints { (make) in
            make.height.equalTo(kIndicatorViewH)
            make.bottom.equalTo(self.snp_bottom)
        }
        
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
