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
    
    @IBOutlet weak var placeholderBtn: UIButton!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func likeButtonClick(sender: UIButton) {
        delegate?.collectionViewCellDidClickedLikeButton(sender)
    }
}
