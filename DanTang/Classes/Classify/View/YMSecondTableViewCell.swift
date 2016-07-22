//
//  YMSecondTableViewCell.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/22.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMSecondTableViewCell: UITableViewCell {

    var groups = [YMGroup]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
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
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
