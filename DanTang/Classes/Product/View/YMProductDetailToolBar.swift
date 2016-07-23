//
//  YMProductDetailToolBar.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/23.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMProductDetailToolBar: UIView {
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.layer.borderColor = YMColor(242, g: 84, b: 85, a: 1.0).CGColor
        likeButton.layer.borderWidth = klineWidth
    }
    
    @IBAction func likeButtonClick() {
        
    }
    
    @IBAction func goTALLButtonClick() {
        
    }

}
