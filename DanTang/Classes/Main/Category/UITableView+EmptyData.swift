//
//  UITableView+EmptyData.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/24.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

public extension UITableView {
    func tableView(message: String, image: String, cellCount: Int) {
        if cellCount == 0 {
            // 没有数据，显示图片
            let button = YMVerticalButton()
            button.setTitleColor(YMColor(200, g: 200, b: 200, a: 1.0), forState: .Normal)
            button.setTitle(message, forState: .Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(15)
            button.setImage(UIImage(named: image), forState: .Normal)
            button.addTarget(self, action: #selector(emptyButtonClick), forControlEvents: .TouchUpInside)
            button.imageView?.sizeToFit()
            backgroundView = button
            separatorStyle = .None
        } else {
            backgroundView = nil
            separatorStyle = .SingleLine
        }
    }
    
    func emptyButtonClick() {
        print("---")
    }
}
