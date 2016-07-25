//
//  YMSearchViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/25.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMSearchViewController: YMBaseViewController {

    var words = [String]()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNav()
        /// 搜索界面数据
        YMNetworkTool.shareNetworkTool.loadHotWords { (hot_words) in
            self.words = hot_words
        }
    }
    
    func setupNav() {
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(searchBarCancelButtonCLick))
    }
    
    func searchBarCancelButtonCLick() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .Plain, target: self, action: #selector(navigationBackClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_sort_21x21_"), style: .Plain, target: self, action: #selector(sortButtonClick))
        searchBar.resignFirstResponder()
    }
    
    /// 搜索条件点击
    func sortButtonClick() {
        
    }
    
    /// 返回按钮
    func navigationBackClick() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜索商品、专题"
        searchBar.height = 35;
        return searchBar
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMSearchViewController: UISearchBarDelegate {
    
    
    
    /// 搜索按钮点击
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
    }
    
    
}
