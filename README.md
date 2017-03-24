### 单糖——良品生活指南：家居零食、礼物美妆、海淘购物
### 感兴趣的朋友可以去 app store 下载 
### [iOS 版下载地址](https://itunes.apple.com/cn/app/id1021442122)

---

> 说明
> 本程序仅供学习交流，不可用于任何商业用途。

## 说明

因为公司使用的是 Objective-C 开发 app，没有使用 swift 来开发，所以决定自己研究 Swift，研究 Swift 的时间不长，对于 Swift 的基本语法有了大致的了解，但是对有些概念和语法还是理解的不深，所以决定模仿一些已经发布的 app，一方面可以让自己更好地理解和使用 Swift，另一方面可以和志同道合的人一起交流，共同进步。

使用 Swift 模仿的第一个 app 是单糖，总体来说界面搭建还算简单，而且结构不是很复杂，本次项目完成了大部分界面，对于项目中的数据接口都是通过 Charles 抓包获得，基本每个界面都是有数据请求，不会抓包的朋友可以看我 [这一篇文章](http://www.jianshu.com/p/235bc6c3ca77)。

项目中有的地方代码写的不是很简洁，毕竟自己能力有限，对 Swift 使用不是很熟练，还请各位朋友不喜勿喷。在本文的最后，有项目的完整源码，喜欢的朋友可以下载下来，如果您感觉我写的代码对您有所帮助，还请在 github 给个 star，非常感谢您的支持！~

## 项目截图

![单糖](http://o9z3a1y1u.bkt.clouddn.com/dangtang.gif)

![首页](http://oat16akgn.bkt.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.29.png)

![单品](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.32.png)

![单品详情](http://oat16akgn.bkt.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8827%E6%97%A5%20%E4%B8%8B%E5%8D%883.21.14.png)

![攻略详情](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.49.png)

![图文介绍](http://oat16akgn.bkt.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8827%E6%97%A5%20%E4%B8%8B%E5%8D%883.21.18.png)

![评论](http://oat16akgn.bkt.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8827%E6%97%A5%20%E4%B8%8B%E5%8D%883.21.19.png)

![分享](http://oat16akgn.bkt.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8827%E6%97%A5%20%E4%B8%8B%E5%8D%883.21.25.png)

![分类](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.34.png)

![搜索](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.22.54.png)

![我](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.36.png)

![设置](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.40.png)

## 项目环境

项目使用 cocoapods 来管理第三方库，所以需要安装 cocoapods，安装方式网上有很多教程，这里不在详述。

- Xcode 8.2.1
- Swift 3.0
- iOS 8.0

使用到的第三方库：

- SwiftyJSON - 解析 JSON 数据
- SnapKit - 设置约束
- Kingfisher - 缓存图片
- SVProgressHUD - 提示框
- FDFullscreenPopGesture - 侧滑手势
- Alamofire - 网络请求

## 项目结构

![项目结构](http://oat16akgn.bkt.clouddn.com/dantang_structure.png)

由于刚接触 Swift，以及对 MVVM 的理解的不深，所以没有使用 MVVM 设计模式，项目使用传统的 MVC 设计模式。


下面是项目的完整结构

- 首页（单糖）
 - Model
  - YMChannel.swift
  - YMHomeItem.swift
  - YMSearchResult.swift
 - View
  - YMHomeCell.swift
  - YMHomeCell.xib
  - YMRefreshControl.swift
  - YMRefreshView.swift
  - YMRefreshView.xib
  - YMSearchRecordView.swift
  - YMSortCell.swift
  - YMSortCell.xib
  - YMSortTableView.swift
 - Controller
  - YMDanTangViewController.swift
  - YMTopicViewController.swift
  - YMDetailViewController.swift
  - YMSearchViewController.swift
- Product（单品）
 - Model
  - YMProduct.swift
  - YMProductDetail.swift
  - YMComment.swift
 - View
  - YMActionSheet.swift
  - YMCollectionViewCell.swift
  - YMCollectionViewCell.xib
  - YMDetailChoiceButtonView.swift
  - YMDetailChoiceButtonView.xib
  - YMDetailCollectionViewCell.swift
  - YMDetailCollectionViewCell.xib
  - YMProductDetailBottomView.swift
  - YMProductDetailToolBar.swift
  - YMProductDetailToolBar.xib
  - YMProductDetailTopView.swift
  - YMShareButtonView.swift
  - YMDetailScrollView.swift
  - YMCommentCell.swift
  - YMCommentCell.xib
 - Controller
  - YMProductViewController.swift
  - YMProductDetailViewController.swift
  - YMTMALLViewController.swift
  - YMTMALLViewController.xib
- Classify（分类）
 - Model
  - YMCollection.swift
  - YMCollectionPost.swift
  - YMGroup.swift
 - View
  - YMCategoryBottomView.swift
  - YMCategoryCollectionViewCell.swift
  - YMCategoryCollectionViewCell.xib
  - YMCollectionTableViewCell.swift
  - YMCollectionTableViewCell.xib
  - YMSeeAllTopicCell.swift
  - YMSeeAllTopicCell.xib
  - YMTopHeaderView.swift
  - YMTopHeaderView.xib
  - YMVerticalButton.swift
 - Controller
  - YMCategoryHeaderViewController.swift
  - YMCategoryViewController.swift
  - YMCollectionDetailController.swift
  - YMCollectionDetailController.xib
  - YMPostDetailViewController.swift
  - YMPostDetailViewController.xib
  - YMSeeAllController.swift
  - YMSeeAllController.xib
- Me（我）
   - Model
      - YMSetting.swift
   - View
    - YMMeChoiceView.swift
    - YMMeFooterView.swift
    - YMMineHeaderView.swift
    - YMSettingCell.swift
    - YMSettingCell.xib
   - Controller
    - YMMessageViewController.swift
    - YMMeViewController.swift
    - YMSettingViewController.swift
- Login&Register（登录和注册）
 - Controller
  - YMLoginViewController.swift
  - YMLoginViewController.xib
  - YMRegisterViewController.swift
  - YMRegisterViewController.xib
  - YMNewfeatureViewController.swift
- Main（主要）
 - Category
  - String+Extension.swift
  - UITableView+EmptyData.swift
  - UIView+Extension.swift
 - Controller
  - YMBaseViewController.swift
  - YMNavigationController.swift
  - YMTabBarController.swift
 - Tools
  - YMConst.swift
  - YMNetworkTool.swift

## 项目文档和数据接口

### 抓取的数据接口请看 [单糖数据接口](https://github.com/hrscy/DanTang/blob/master/单糖数据接口.md) 和 [单糖数据接口详细数据](https://github.com/hrscy/DanTang/blob/master/单糖数据接口详细数据.md)。

#### 下载项目之后，点击此处，查看项目文档 [项目文档](https://github.com/hrscy/DanTang/blob/master/docs/index.html) 或者直接打开文件目录 『docs/index.html』。

## 运行项目出现的问题都可以给我留言或者直接加我的 QQ 联系，我会尽快回复。

## [github下载地址](https://github.com/hrscy/DanTang) 

## 喜欢的朋友希望可以给个 Star，十分感谢您的支持！~
