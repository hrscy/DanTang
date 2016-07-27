//
//  YMTopicViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let homeCellID = "homeCellID"

class YMTopicViewController: UITableViewController {
    
    var type = Int()
    
    /// 首页列表数据
    var items = [YMHomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YMGlobalColor()
        
        setupTableView()
        
        // 添加刷新控件
        refreshControl = YMRefreshControl()
        refreshControl?.beginRefreshing()
        refreshControl?.addTarget(self, action: #selector(loadHomeData), forControlEvents: .ValueChanged)
        // 获取首页数据
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadHomeInfo(type) { (homeItems) in
            weakSelf!.items = homeItems
            weakSelf!.tableView!.reloadData()
            weakSelf!.refreshControl?.endRefreshing()
        }
    }
    
    func loadHomeData() {
        // 获取首页数据
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadHomeInfo(type) { (homeItems) in
            weakSelf!.items = homeItems
            weakSelf!.tableView!.reloadData()
            weakSelf!.refreshControl?.endRefreshing()
        }
    }
    
    func setupTableView() {
        tableView.rowHeight = 160
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        let nib = UINib(nibName: String(YMHomeCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: homeCellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMTopicViewController: YMHomeCellDelegate {
    // MARK: - UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier(homeCellID) as! YMHomeCell
        homeCell.selectionStyle = .None
        homeCell.homeItem = items[indexPath.row]
        homeCell.delegate = self
        return homeCell
    }
    // MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = YMDetailViewController()
        detailVC.homeItem = items[indexPath.row]
        detailVC.title = "攻略详情"
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - YMHomeCellDelegate
    func homeCellDidClickedFavoriteButton(button: UIButton) {
        if !NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            let loginVC = YMLoginViewController()
            loginVC.title = "登录"
            let nav = YMNavigationController(rootViewController: loginVC)
            presentViewController(nav, animated: true, completion: nil)
        } else {
            
        }
    }
    
}
