//
//  YMSortTableView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/25.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

let sortTableViewCellID = "sortTableViewCellID"

class YMSortTableView: UIView {
    
    let cells = ["默认排序", "按热度排序", "价格从低到高", "价格从高到低"]
    
    func show() {
        
        let window = UIApplication.sharedApplication().keyWindow
        self.frame = UIScreen.mainScreen().bounds
        self.backgroundColor = YMColor(0, g: 0, b: 0, a: 0.3)
        window?.addSubview(self)
    }
    
    override func touchesEstimatedPropertiesUpdated(touches: Set<NSObject>) {
        self.removeFromSuperview()
    }
    
    func dismiss() {
        self.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgView)
        
        bgView.addSubview(tableView)
        
        bgView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(60)
            make.right.equalTo(self)
            make.size.equalTo(CGSizeMake(140, 150))
        }
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(bgView).offset(UIEdgeInsetsMake(kMargin, 0, 0, 0))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgView: UIImageView = {
        let bgView = UIImageView()
        bgView.userInteractionEnabled = true
        bgView.image = UIImage(named: "bg_menu_sort_140x46_")
        return bgView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        tableView.rowHeight = 35
        tableView.scrollEnabled = false
        tableView.separatorStyle = .SingleLine
        tableView.separatorColor = UIColor.whiteColor()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: sortTableViewCellID)
        return tableView
    }()
}

extension YMSortTableView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sortTableViewCellID)
        cell?.textLabel?.text = cells[indexPath.row]
        cell?.selectionStyle = .None
        cell?.backgroundColor = UIColor.clearColor()
        cell?.textLabel?.textColor = UIColor.whiteColor()
        cell?.textLabel?.font = UIFont.systemFontOfSize(15)
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
}