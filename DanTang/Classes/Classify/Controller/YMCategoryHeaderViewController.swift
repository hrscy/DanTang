//
//  YMCategoryHeaderViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/22.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  顶部 专题合集
//

import UIKit

let categoryCollectionCellID = "YMCategoryCollectionViewCell"

class YMCategoryHeaderViewController: YMBaseViewController {
    
    var collections = [YMCollection]()
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        // 设置 UI
        setupUI()
        /// 分类界面 顶部 专题合集
        YMNetworkTool.shareNetworkTool.loadCategoryCollection(6) { (collections) in
            self.collections = collections
            self.collectionView!.reloadData()
        }
    }
    
    // 设置 UI
    private func setupUI() {
        
        let headerView = NSBundle.mainBundle().loadNibNamed(String(YMTopHeaderView), owner: nil, options: nil).last as! YMTopHeaderView
        headerView.frame = CGRectMake(0, 0, SCREENW, 40)
        headerView.delegate = self
        view.addSubview(headerView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: CGRectMake(0, 40, SCREENW, 95), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteColor()
        let cellNib = UINib(nibName: String(YMCategoryCollectionViewCell), bundle: nil)
        collectionView.registerNib(cellNib, forCellWithReuseIdentifier: categoryCollectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
}

extension YMCategoryHeaderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, YMTopHeaderViewDelegate {
    
    // MARK: - YMTopHeaderViewDelegate
    func topViewDidClickedMoreButton(button: UIButton) {
        let seeAllVC = YMSeeAllController()
        seeAllVC.title = "查看全部"
        navigationController?.pushViewController(seeAllVC, animated: true)
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(categoryCollectionCellID, forIndexPath: indexPath) as! YMCategoryCollectionViewCell
        cell.collection = collections[indexPath.item]
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let collectionDetailVC = YMCollectionDetailController()
        let collection = collections[indexPath.row]
        collectionDetailVC.title = collection.title
        collectionDetailVC.id = collection.id
        collectionDetailVC.type = "专题合集"
        navigationController?.pushViewController(collectionDetailVC, animated: true)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(kitemW, kitemH)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin)
    }
}
