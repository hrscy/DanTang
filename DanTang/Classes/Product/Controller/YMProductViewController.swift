//
//  YMProductViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/19.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  单品
//

import UIKit

let collectionCellID = "YMCollectionViewCell"

class YMProductViewController: YMBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, YMCollectionViewCellDelegate {
    
    var products = [YMProduct]()
    
    weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 设置collectionView
        setupCollectionView()
        
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadProductData { (products) in
            weakSelf!.products = products
            weakSelf!.collectionView!.reloadData()
        }
    }
    
    /// 设置collectionView
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.backgroundColor = view.backgroundColor
        collectionView.dataSource = self
        let nib = UINib(nibName: String(YMCollectionViewCell), bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: collectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellID, forIndexPath: indexPath) as! YMCollectionViewCell
        cell.product = products[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
         let productDetailVC = YMProductDetailViewController()
        productDetailVC.title = "商品详情"
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
