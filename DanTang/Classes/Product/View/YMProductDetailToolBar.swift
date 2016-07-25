//
//  YMProductDetailToolBar.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/23.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

protocol YMProductDetailToolBarDelegate: NSObjectProtocol {
    func toolBarDidClickedTMALLButton()
}

class YMProductDetailToolBar: UIView {
    
    weak var delegate: YMProductDetailToolBarDelegate?
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.layer.borderColor = YMGlobalRedColor().CGColor
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
    
    @IBAction func goTMALLButtonClick() {
        delegate?.toolBarDidClickedTMALLButton()
    }
}
