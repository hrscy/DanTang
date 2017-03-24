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

class YMSeeAllController: YMBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var collections = [YMCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: String(describing: YMSeeAllTopicCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: seeAllcellID)
        tableView.separatorStyle = .none
        tableView.rowHeight = 160
        /// 分类界面 顶部 专题合集
        YMNetworkTool.shareNetworkTool.loadCategoryCollection(limit: 20) { (collections) in
            self.collections = collections
            self.tableView!.reloadData()
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: seeAllcellID) as! YMSeeAllTopicCell
        cell.collection = collections[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collectionDetailVC = YMCollectionDetailController()
        let collection = collections[indexPath.row]
        collectionDetailVC.title = collection.title
        collectionDetailVC.id = collection.id
        collectionDetailVC.type = "专题合集"
        navigationController?.pushViewController(collectionDetailVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
