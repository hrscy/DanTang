//
//  YMHomeItem.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import Foundation

class YMHomeItem: NSObject {
    
    var content_url: String?
    var cover_image_url: String?
    var created_at: Int?
    var id: Int?
    var liked: Int?
    var likes_count: Int?
    var share_msg: String?
    var published_at: Int?
    var short_title: String?
    var status: Int?
    var type: String?
    var title: String?
    var template: String?
    var updated_at: Int?
    var url: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        content_url = dict["content_url"] as? String
        cover_image_url = dict["cover_image_url"] as? String
        created_at = dict["created_at"] as? Int
        id = dict["id"] as? Int
        liked = dict["liked"] as? Int
        likes_count = dict["likes_count"] as? Int
        share_msg = dict["share_msg"] as? String
        published_at = dict["published_at"] as? Int
        short_title = dict["short_title"] as? String
        status = dict["status"] as? Int
        type = dict["type"] as? String
        title = dict["title"] as? String
        template = dict["template"] as? String
        updated_at = dict["updated_at"] as? Int
        url = dict["url"] as? String
    }
    
}
