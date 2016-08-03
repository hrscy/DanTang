//
//  YMComment.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/27.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import Foundation

class YMComment: NSObject {

    var content: String?

    var id: Int?

    var created_at: Int?

    var show: Bool?

    var item_id: Int?

    var user: User?
    
    init(dict: [String: AnyObject]) {
        super.init()
        id = dict["id"] as? Int
        created_at = dict["created_at"] as? Int
        show = dict["show"] as? Bool
        content = dict["content"] as? String
        item_id = dict["item_id"] as? Int
        user = User(dict: dict["user"] as! [String: AnyObject])
    }
}

class User: NSObject {

    var id: Int?

    var avatar_url: String?

    var nickname: String?

    var role: Int?

    var can_mobile_login: Bool?

    init(dict: [String: AnyObject]) {
        super.init()
        id = dict["id"] as? Int
        avatar_url = dict["avatar_url"] as? String
        nickname = dict["nickname"] as? String
        role = dict["role"] as? Int
        can_mobile_login = dict["can_mobile_login"] as? Bool
    }
}

