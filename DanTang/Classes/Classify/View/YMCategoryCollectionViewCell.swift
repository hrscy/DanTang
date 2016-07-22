//
//  YMCategoryCollectionViewCell.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/22.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import Kingfisher

class YMCategoryCollectionViewCell: UICollectionViewCell {

    var collection: YMCollection? {
        didSet {
            let url = collection!.banner_image_url
            collectionImageView.kf_setImageWithURL(NSURL(string: url!)!)
        }
    }
    
    @IBOutlet weak var collectionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
