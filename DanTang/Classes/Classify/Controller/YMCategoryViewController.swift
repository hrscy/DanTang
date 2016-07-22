//
//  YMCategoryViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/19.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  分类界面
//

import UIKit

let categoryGroupFirstID = "categoryGroupFirstID"
let categoryGroupSecondID = "categoryGroupSecondID"


class YMCategoryViewController: YMBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var outGroups = [AnyObject]()
    
    weak var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(categoryRightBBClick))
        
        
        setupTableView()
        
        /// 分类界面 风格,品类
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadCategoryGroup { (outGroups) in
            weakSelf?.outGroups = outGroups
            weakSelf?.tableView?.reloadData()
        }
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        // 顶部专题合集
        tableView.tableHeaderView = setupHeaderView()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .None
//        let firstNib = UINib(nibName: String(YMFirstGroupCell), bundle: nil)
//        tableView.registerNib(firstNib, forCellReuseIdentifier: categoryGroupFirstID)
//        let secondNib = UINib(nibName: String(YMSecondTableViewCell), bundle: nil)
//        tableView.registerNib(secondNib, forCellReuseIdentifier: categoryGroupSecondID)
        tableView.registerClass(YMFirstGroupCell.self, forCellReuseIdentifier: categoryGroupFirstID)
        tableView.registerClass(YMSecondTableViewCell.self, forCellReuseIdentifier: categoryGroupSecondID)
        view.addSubview(tableView)
        self.tableView = tableView
    }
    
    private func setupHeaderView() -> UIView {
        let headerViewController = YMCategoryHeaderViewController()
        addChildViewController(headerViewController)
        
        let bgView = UIView(frame: CGRectMake(0, kTitlesViewY, SCREENW, 150))
        view.addSubview(bgView)
        let headerVC = childViewControllers[0]
        bgView.addSubview(headerVC.view)
        return bgView
    }
    
    func categoryRightBBClick() {
        print(#function)
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return outGroups.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(categoryGroupFirstID) as! YMFirstGroupCell
            cell.selectionStyle = .None
            cell.groups = outGroups[indexPath.section] as! [YMGroup]
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(categoryGroupSecondID) as! YMSecondTableViewCell
            cell.selectionStyle = .None
            cell.groups = outGroups[indexPath.section] as! [YMGroup]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(150)
        } else if indexPath.section == 1 {
            return CGFloat(250)
        }
        return 0
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kMargin
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
