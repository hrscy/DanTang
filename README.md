# 单糖

> 说明
> 本程序仅供学习交流，不可用于任何商业用途。

## 说明

应为公司使用的是 Objective-C 开发 app，没有使用 swift 来开发，所以决定自己研究 Swift，研究 Swift 的时间不长，对于 Swift 的基本语法有了大致的了解，但是对有些概念和语法还是理解的不深，所以决定模仿一些已经发布的 app，一方面可以让自己更好地理解和使用 Swift，另一方面可以和志同道合的人一起交流，共同进步。

使用 Swift 模仿的第一个 app 是单糖，总体来说界面搭建还算简单，而且结构不是很复杂，本次项目完成了大部分界面，对于项目中的数据接口都是通过 Charles 抓包获得，基本每个界面都是有数据请求，不会抓包的朋友可以看我 [这一篇文章](http://www.jianshu.com/p/235bc6c3ca77)。

## 项目截图

![](http://oat16akgn.bkt.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.29.png)
![](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.32.png)
![](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.49.png)
![](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.34.png)
![](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.22.54.png)
![](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.36.png)
![](http://oat16akgn.bkt.clouddn.com/dantang/Simulator%20Screen%20Shot%202016%E5%B9%B47%E6%9C%8826%E6%97%A5%20%E4%B8%8B%E5%8D%885.14.40.png)

## 项目环境

项目使用 cocoapods 来管理第三方库，所以需要安装 cocoapods，安装方式网上有很多教程，这里不在详述。

使用到的第三方库：

- SwiftyJSON - 解析 JSON 数据
- SnapKit - 设置约束
- Kingfisher - 缓存图片
- SVProgressHUD - 提示框
- FDFullscreenPopGesture - 侧滑手势
- Alamofire - 网络请求

## 项目结构

![](http://oat16akgn.bkt.clouddn.com/dantang_structure.png)

由于刚接触 Swift，以及对 MVVM 的理解的不深，所以没有使用 MVVM 设计模式，项目使用传统的 MVC 设计模式。

- 首页（单糖）
- 单品
- 分类
- 我
- 登录和注册

抓取的数据接口请看 [单糖数据接口](#单糖数据接口.md) 和 [单糖数据接口详细数据](单糖数据接口详细数据.md)。

## 运行项目出现的问题都可以给我留言，我会尽快回复。

