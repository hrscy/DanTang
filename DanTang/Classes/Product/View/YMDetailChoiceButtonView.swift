//
//  YMDetailChoiceButton.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/27.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMDetailChoiceButtonView: UIView {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBAction func introduceButtonClick(sender: UIButton) {
        UIView.animateWithDuration(kAnimationDuration) {
            self.leadingConstraint.constant = 0
            self.layoutIfNeeded()
        }
    }
    
    @IBAction func commentButtonClick(sender: UIButton) {
        UIView.animateWithDuration(kAnimationDuration) { 
            self.leadingConstraint.constant = SCREENW * 0.5
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
