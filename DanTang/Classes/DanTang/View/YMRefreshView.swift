//
//  YMRefreshView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/26.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMRefreshView: UIView {

    @IBOutlet weak var arrowIcon: UIImageView!
    
    @IBOutlet weak var tipView: UIView!
    
    @IBOutlet weak var loadingView: UIImageView!
    
    /// 旋转箭头
    func rotationArrowIcon(flag: Bool) {
        var angle = M_PI
        angle += flag ? -0.01 : 0.01
        UIView.animate(withDuration: kAnimationDuration) { 
            self.arrowIcon.transform = self.arrowIcon.transform.rotated(by: CGFloat(angle))
        }
    }
    
    /// 开始转圈动画
    func startLodingViewAnimation() {
        
        tipView.isHidden = true
        // 创建动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * M_PI
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        loadingView.layer.add(animation, forKey: nil)
    }
    
    /// 停止转圈动画
    func stopLodingViewAnimation() {
        tipView.isHidden = false
        loadingView.layer.removeAllAnimations()
    }
    
    class func refreshView() -> YMRefreshView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)!.last as! YMRefreshView
    }
    
}
