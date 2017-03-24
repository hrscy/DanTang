//
//  ViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 2017/3/24.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

let newFeatureID = "newFeatureID"

class YMNewfeatureViewController: UICollectionViewController {

    /// 布局对象
    private var layout: UICollectionViewFlowLayout = YMNewfeatureLayout()
    
    init() {
        super.init(collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(YMNewfeatureCell.self, forCellWithReuseIdentifier: newFeatureID)
        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

/// YMNewfeatureCell
private class YMNewfeatureCell: UICollectionViewCell {
    private var imageIndex: Int? {
        didSet {
//            iconView.image = UIImage(named: "walkthrough_\(imageIndex! + 1)")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(iconView)
    }
    
    private lazy var iconView = UIImageView()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "btn_begin"), for: .normal)
        btn.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
        btn.layer.masksToBounds = true
        btn.isHidden = true
        return btn
    }()
    
    @objc func startButtonClick() {
        UIApplication.shared.keyWindow?.rootViewController = YMTabBarController()
    }
}

private class YMNewfeatureLayout: UICollectionViewFlowLayout {

    /// 准备布局
    fileprivate override func prepare() {
        // 设置 layout 布局
        itemSize = UIScreen.main.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
        // 设置 contentView 属性
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.isPagingEnabled = true
    }
}
