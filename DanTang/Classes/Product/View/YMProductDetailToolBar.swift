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
        likeButton.setImage(UIImage(named: "content-details_like_16x16_"), forState: .Normal)
        likeButton.setImage(UIImage(named: "content-details_like_selected_16x16_"), forState: .Selected)
    }
    
    @IBAction func likeButtonClick(sender: UIButton) {
        // 判断是否登录
        if NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            sender.selected = !sender.selected
        } else {
            let loginVC = YMLoginViewController()
            loginVC.title = "登录"
            let nav = YMNavigationController(rootViewController: loginVC)
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(nav, animated: true, completion: nil)
        }
    }
    
    @IBAction func goTALLButtonClick() {
        
    }
}
