//
//  YMCollectionDetailController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/24.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let collectionTableCellID = "YMCollectionTableViewCell"

class YMCollectionDetailController: UIViewController {
    
    var type = String()
    
    var posts = [YMCollectionPost]()
    
    var id: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: String(YMCollectionTableViewCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: collectionTableCellID)
        tableView.rowHeight = 150
        tableView.separatorStyle = .None
        weak var weakSelf = self
        if type == "专题合集" {
            YMNetworkTool.shareNetworkTool.loadCollectionPosts(id!) { (posts) in
                weakSelf!.posts = posts
                weakSelf!.tableView.reloadData()
            }
        } else {
            YMNetworkTool.shareNetworkTool.loadStylesOrCategoryInfo(id!, finished: { (items) in
                weakSelf!.posts = items
                weakSelf!.tableView.reloadData()
            })
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMCollectionDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(collectionTableCellID) as! YMCollectionTableViewCell
        cell.selectionStyle = .None
        cell.collectionPost = posts[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let postDetailVC = YMPostDetailViewController()
        postDetailVC.post = posts[indexPath.row]
        postDetailVC.title = "攻略详情"
        navigationController?.pushViewController(postDetailVC, animated: true)
    }
}
