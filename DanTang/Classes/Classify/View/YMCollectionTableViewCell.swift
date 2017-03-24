//
//  YMTableViewCell.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/24.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class YMCollectionTableViewCell: UITableViewCell {
    
    var collectionPost: YMCollectionPost? {
        didSet {
            let url = collectionPost!.cover_image_url
            bgImageView.kf.setImage(with: URL(string: url!)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderButton.isHidden = true
            }
            titleLabel.text = collectionPost!.title
            likeButton.setTitle(" \(collectionPost!.likes_count!) ", for: .normal)
        }
    }
    
    @IBOutlet weak var placeholderButton: UIButton!
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
