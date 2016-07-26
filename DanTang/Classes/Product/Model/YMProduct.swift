//
//  YMProduct.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/21.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import Foundation

class YMProduct: NSObject {
    var cover_image_url: String?
    var created_at: Int?
    var describe: String?
    var editor_id: Int?
    var favorites_count: Int?
    var id: Int?
    var image_urls: [String]?
    var is_favorite: Bool?
    var name: String?
    var price: String?
    var purchase_id: Int?
    var purchase_status: Int?
    var purchase_type: Int?
    var purchase_url: String?
    var updated_at: Int?
    var url: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        cover_image_url = dict["cover_image_url"] as? String
        created_at = dict["created_at"] as? Int
        describe = dict["description"] as? String
        editor_id = dict["editor_id"] as? Int
        favorites_count = dict["favorites_count"] as? Int
        id = dict["id"] as? Int
        image_urls = dict["image_urls"] as? [String]
        is_favorite = dict["is_favorite"] as? Bool
        name = dict["name"] as? String
        price = dict["price"] as? String
        purchase_id = dict["purchase_id"] as? Int
        purchase_status = dict["purchase_status"] as? Int
        purchase_type = dict["purchase_type"] as? Int
        purchase_url = dict["purchase_url"] as? String
        updated_at = dict["updated_at"] as? Int
        url = dict["url"] as? String
    }
}
