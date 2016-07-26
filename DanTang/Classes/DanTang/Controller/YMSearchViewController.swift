//
//  YMSearchViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/25.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let searchCollectionCellID = "searchCollectionCellID"

class YMSearchViewController: YMBaseViewController {
    
    /// 搜索结果列表
    var results = [YMSearchResult]()
    
    weak var collectionView: UICollectionView?
    
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
        // 设置导航栏
        setupNav()
        
        view.addSubview(searchRecordView)
        
    }
    
    // 设置导航栏
    func setupNav() {
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(navigationBackClick))
    }
    
    /// 设置collectionView
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        collectionView.backgroundColor = view.backgroundColor
        collectionView.dataSource = self
        let nib = UINib(nibName: String(YMCollectionViewCell), bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: searchCollectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    /// 搜索条件点击
    func sortButtonClick() {
        popView.show()
    }
    
    private lazy var popView: YMSortTableView = {
        let popView = YMSortTableView()
        popView.delegate = self
        return popView
    }()
    
    /// 返回按钮、取消按钮点击
    func navigationBackClick() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜索商品、专题"
        return searchBar
    }()
    
    private lazy var searchRecordView: YMSearchRecordView = {
        let searchRecordView = YMSearchRecordView()
        searchRecordView.backgroundColor = YMGlobalColor()
        searchRecordView.frame = CGRectMake(0, 64, SCREENW, SCREENH - 64)
        return searchRecordView
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMSearchViewController: UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout, YMCollectionViewCellDelegate, YMSortTableViewDelegate {
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        /// 设置collectionView
        setupCollectionView()
        return true
    }
    
    /// 搜索按钮点击
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .Plain, target: self, action: #selector(navigationBackClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_sort_21x21_"), style: .Plain, target: self, action: #selector(sortButtonClick))
        /// 根据搜索条件进行搜索
        let keyword = searchBar.text
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadSearchResult(keyword!, sort: "") { (results) in
            weakSelf!.results = results
            weakSelf!.collectionView!.reloadData()
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(searchCollectionCellID, forIndexPath: indexPath) as! YMCollectionViewCell
        cell.result = results[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let productDetailVC = YMProductDetailViewController()
        productDetailVC.title = "商品详情"
        productDetailVC.type = String(self)
        productDetailVC.result = results[indexPath.item]
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = (UIScreen.mainScreen().bounds.width - 20) / 2
        let height: CGFloat = 245
        return CGSizeMake(width, height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    // MARK: - YMCollectionViewCellDelegate
    func collectionViewCellDidClickedLikeButton(button: UIButton) {
        if !NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            let loginVC = YMLoginViewController()
            loginVC.title = "登录"
            let nav = YMNavigationController(rootViewController: loginVC)
            presentViewController(nav, animated: true, completion: nil)
        } else {
            
        }
    }
    
    // MARK: - YMSortTableViewDelegate
    func sortView(sortView: YMSortTableView, didSelectSortAtIndexPath sort: String) {
        /// 根据搜索条件进行搜索
        let keyword = searchBar.text
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadSearchResult(keyword!, sort: sort) { (results) in
            sortView.dismiss()
            weakSelf!.results = results
            weakSelf!.collectionView!.reloadData()
        }
    }
    
}
