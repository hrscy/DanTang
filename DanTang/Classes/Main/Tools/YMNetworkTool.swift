//
//  YMNetworkTool.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON

class YMNetworkTool: NSObject {
    /// 单例
    static let shareNetworkTool = YMNetworkTool()
    
    /// 获取首页数据
    func loadHomeInfo(id: Int, finished:(homeItems: [YMHomeItem]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/channels/\(id)/items?gender=1&generation=1&limit=20&offset=0"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    // 移除加载提示
                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject {
                        var homeItems = [YMHomeItem]()
                        for item in items {
                            let homeItem = YMHomeItem(dict: item as! [String: AnyObject])
                            homeItems.append(homeItem)
                        }
                        finished(homeItems: homeItems)
                    }
                }
        }
    }
    
    /// 获取首页顶部选择数据
    func loadHomeTopData(finished:(ym_channels: [YMChannel]) -> ()) {
        
        let url = BASE_URL + "v2/channels/preset?gender=1&generation=1"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    if let channels = data!["channels"]?.arrayObject {
                        var ym_channels = [YMChannel]()
                        for channel in channels {
                            let ym_channel = YMChannel(dict: channel as! [String: AnyObject])
                            ym_channels.append(ym_channel)
                        }
                        finished(ym_channels: ym_channels)
                    }
                }
        }
    }
    
    /// 获取单品数据
    func loadProductData(finished:(products: [YMProduct]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v2/items?gender=1&generation=1&limit=20&offset=0"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let items = data["items"]?.arrayObject {
                            var products = [YMProduct]()
                            for item in items {
                                if let itemData = item["data"] {
                                    let product = YMProduct(dict: itemData as! [String: AnyObject])
                                    products.append(product)
                                }
                            }
                            finished(products: products)
                        }
                    }
                }
        }
    }
    
    /// 分类界面 顶部 专题合集
    func loadCategoryCollection(finished:(collections: [YMCollection]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/collections?limit=6&offset=0"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let collectionsData = data["collections"]?.arrayObject {
                            var collections = [YMCollection]()
                            for item in collectionsData {
                                let collection = YMCollection(dict: item as! [String: AnyObject])
                                collections.append(collection)
                            }
                            finished(collections: collections)
                        }
                    }
                }
        }
    }
    
    /// 顶部 专题合集 -> 专题列表
    func loadCollectionPosts(id: Int, finished:(posts: [YMCollectionPost]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/collections/\(id)/posts?gender=1&generation=1&limit=20&offset=0"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let postsData = data["posts"]?.arrayObject {
                            var posts = [YMCollectionPost]()
                            for item in postsData {
                                let post = YMCollectionPost(dict: item as! [String: AnyObject])
                                posts.append(post)
                            }
                            finished(posts: posts)
                        }
                    }
                }
        }
    }
    
    /// 分类界面 风格,品类
    func loadCategoryGroup(finished:(outGroups: [AnyObject]) -> ()) {
        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/channel_groups/all?"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let channel_groups = data["channel_groups"]?.arrayObject {
                            // outGroups 存储两个 inGroups 数组，inGroups 存储 YMGroup 对象
                            // outGroups 是一个二维数组
                            var outGroups = [AnyObject]()
                            var inGroups = [YMGroup]()
                            for channel_group in channel_groups {
                                let channels = channel_group["channels"] as! [AnyObject]
                                for channel in channels {
                                    let group = YMGroup(dict: channel as! [String: AnyObject])
                                    inGroups.append(group)
                                }
                                outGroups.append(inGroups)
                            }
                            finished(outGroups: outGroups)
                        }
                    }
                }
        }
    }
    
    
}
