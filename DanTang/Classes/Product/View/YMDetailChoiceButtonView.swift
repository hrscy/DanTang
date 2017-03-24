//
//  YMDetailChoiceButton.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/27.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

protocol YMDetailChoiceButtonViewDegegate: NSObjectProtocol {
    /// 图文介绍按钮点击
    func choiceIntroduceButtonClick()
    /// 评论按钮点击
    func choicecommentButtonClick()
}

class YMDetailChoiceButtonView: UIView {
    
    weak var delegate: YMDetailChoiceButtonViewDegegate?

    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBAction func introduceButtonClick(sender: UIButton) {
        UIView.animate(withDuration: kAnimationDuration) {
            self.lineView.x = 0
        }
        delegate?.choiceIntroduceButtonClick()
    }
    
    @IBAction func commentButtonClick(sender: UIButton) {
        UIView.animate(withDuration: kAnimationDuration) {
            self.lineView.x = SCREENW * 0.5
        }
        delegate?.choicecommentButtonClick()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func choiceButtonView() -> YMDetailChoiceButtonView{
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)!.last as! YMDetailChoiceButtonView
    }
    
}
