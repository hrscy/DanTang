//
//  YMFirstGroupCell.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/22.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class YMFirstGroupCell: UITableViewCell {
    var groups = [YMGroup]()

    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var forthButton: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    func setupUI() {
        // 标题
        let label = UILabel()
        label.x = 10
        label.height = 35
        label.text = "风格"
        label.textColor = YMColor(0, g: 0, b: 0, a: 0.6)
        label.font = UIFont.systemFontOfSize(15)
        contentView.addSubview(label)
        // 创建按钮
        for index in 0..<groups.count {
            let button = UIButton()
            
            contentView.addSubview(button)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
