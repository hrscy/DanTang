//
//  YMProductDetailTopView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/26.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

let detailCollectionViewCellID = "detailCollectionViewCellID"

class YMProductDetailTopView: UIView {
    
    var imageURLs = [String]()
    
    var product: YMProduct? {
        didSet {
            imageURLs = product!.image_urls!
            collectionView.reloadData()
            pageControl.numberOfPages = imageURLs.count
            titleLabel.text = product!.name
            priceLabel.text = "￥\(product!.price!)"
            describeLabel.text = product!.describe
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        addSubview(pageControl)
        
        addSubview(titleLabel)
        
        addSubview(priceLabel)
        
        addSubview(describeLabel)
        
        pageControl.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(collectionView.snp_bottom).offset(-30)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.equalTo(collectionView.snp_bottom).offset(5)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self.snp_right).offset(-5)
            make.height.equalTo(30)
        }
        
        priceLabel.snp_makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp_left)
            make.right.equalTo(titleLabel.snp_right)
            make.top.equalTo(titleLabel.snp_bottom).offset(5)
            make.height.equalTo(25)
        }
        
        describeLabel.snp_makeConstraints { (make) in
            make.left.equalTo(priceLabel.snp_left)
            make.right.equalTo(priceLabel.snp_right)
            make.top.equalTo(priceLabel.snp_bottom).offset(5)
            make.bottom.equalTo(self.snp_bottom).offset(-5)
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRectMake(0, 0, SCREENW, 375), collectionViewLayout: YMDetailLayout())
        let nib = UINib(nibName: String(YMDetailCollectionViewCell), bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: detailCollectionViewCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        return collectionView
    }()
    
    /// 懒加载，pageControl
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        return pageControl
    }()
    
    /// 标题
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.blackColor()
        return titleLabel
    }()
    
    /// 价格
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.numberOfLines = 0
        priceLabel.textColor = YMGlobalRedColor()
        priceLabel.font = UIFont.systemFontOfSize(16)
        return priceLabel
    }()
    
    /// 描述
    private lazy var describeLabel: UILabel = {
        let describeLabel = UILabel()
        describeLabel.numberOfLines = 0
        describeLabel.textColor = YMColor(0, g: 0, b: 0, a: 0.6)
        describeLabel.font = UIFont.systemFontOfSize(15)
        return describeLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension YMProductDetailTopView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(detailCollectionViewCellID, forIndexPath: indexPath) as! YMDetailCollectionViewCell
        let url = imageURLs[indexPath.item]
        cell.bgImageView.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
            cell.placeholderButton.hidden = true
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let page = offsetX / scrollView.width
        pageControl.currentPage = Int(page + 0.5)
    }
    
}

private class YMDetailLayout: UICollectionViewFlowLayout {
    /// 准备布局
    private override func prepareLayout() {
        // 设置 layout 布局
        itemSize = CGSizeMake(SCREENW, 375)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        // 设置 contentView 属性
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.pagingEnabled = true
    }
}
