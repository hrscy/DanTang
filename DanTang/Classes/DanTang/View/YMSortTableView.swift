//
//  YMSortTableView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/25.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  点击排序按钮，弹出的排序列表
//

import UIKit
import SnapKit

let sortTableViewCellID = "sortTableViewCellID"

protocol YMSortTableViewDelegate: NSObjectProtocol {
    func sortView(sortView: YMSortTableView, didSelectSortAtIndexPath sort: String)
}

class YMSortTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: YMSortTableViewDelegate?
    
    let cells = ["默认排序", "按热度排序", "价格从低到高", "价格从高到低"]
    /// 排序方式
    let sorts = ["", "hot", "price%3Aasc", "price%3Adesc"]
    
    func show() {
        let window = UIApplication.shared.keyWindow
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.clear
        window?.addSubview(self)
    }
    
    func touchesEstimatedPropertiesUpdated(touches: Set<NSObject>) {
        self.removeFromSuperview()
    }
    
    func dismiss() {
        self.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgView)
        
        bgView.addSubview(tableView)
        
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(60)
            make.right.equalTo(self)
            make.size.equalTo(CGSize(width: 140, height: 150))
        }
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(bgView).offset(UIEdgeInsetsMake(kMargin, kMargin, -kMargin, 0) as! ConstraintOffsetTarget)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgView: UIImageView = {
        let bgView = UIImageView()
        bgView.isUserInteractionEnabled = true
        bgView.image = UIImage(named: "bg_menu_sort_140x46_")
        return bgView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = 35
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        let nib = UINib(nibName: String(describing: YMSortCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: sortTableViewCellID)
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sortTableViewCellID) as! YMSortCell
        cell.titleLabel.text = cells[indexPath.row]
        return cell
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        let sort = sorts[indexPath.row]
        delegate?.sortView(sortView: self, didSelectSortAtIndexPath: sort)
    }
}
