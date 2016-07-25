//
//  YMCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by 杨蒙 on 16/7/21.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

protocol YMCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCellDidClickedLikeButton(button: UIButton)
}

class YMCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: YMCollectionViewCellDelegate?
    
    var product: YMProduct? {
        didSet {
            let url = product!.cover_image_url!
            productImageView.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            likeButton.setTitle(" " + String(product!.favorites_count!) + " ", forState: .Normal)
            titleLabel.text = product!.name
            priceLabel.text = "￥" + String(product!.price!)
        }
    }
    // 占位图片
    @IBOutlet weak var placeholderBtn: UIButton!
    // 背景图片
    @IBOutlet weak var productImageView: UIImageView!
    // 标题
    @IBOutlet weak var titleLabel: UILabel!
    // 价格
    @IBOutlet weak var priceLabel: UILabel!
    // 喜欢按钮
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func likeButtonClick(sender: UIButton) {
        delegate?.collectionViewCellDidClickedLikeButton(sender)
    }
}
