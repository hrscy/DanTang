//
//  YMSeeMoreController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/22.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  查看更多
//

import UIKit

let seeAllcellID = "YMSeeAllTopicCell"

class YMSeeAllController: YMBaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var collections = [YMCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: String(YMSeeAllTopicCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: seeAllcellID)
        tableView.separatorStyle = .None
        tableView.rowHeight = 160
        /// 分类界面 顶部 专题合集
        YMNetworkTool.shareNetworkTool.loadCategoryCollection(20) { (collections) in
            self.collections = collections
            self.tableView!.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMSeeAllController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(seeAllcellID) as! YMSeeAllTopicCell
        cell.collection = collections[indexPath.row]
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let collectionDetailVC = YMCollectionDetailController()
        let collection = collections[indexPath.row]
        collectionDetailVC.title = collection.title
        collectionDetailVC.id = collection.id
        collectionDetailVC.type = "专题合集"
        navigationController?.pushViewController(collectionDetailVC, animated: true)
    }
}
