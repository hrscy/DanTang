//
//  YMSearchResult.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/25.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMSearchResult: NSObject {

    var favorites_count: Int?

    var likes_count: Int?

    var id: Int?

    var price: String?

    var liked: Bool?

    var cover_image_url: String?

    var describe: String?

    var name: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        favorites_count = dict["favorites_count"] as? Int
        price = dict["price"] as? String
        liked = dict["liked"] as? Bool
        cover_image_url = dict["cover_image_url"] as? String
        describe = dict["description"] as? String
    }
}
