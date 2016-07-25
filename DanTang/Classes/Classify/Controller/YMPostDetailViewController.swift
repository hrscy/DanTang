//
//  YMPostDetailViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/24.
//  Copyright © 2016年 hrscy. All rights reserved.
//  
//  详情
//

import UIKit

class YMPostDetailViewController: YMBaseViewController {

    var post: YMCollectionPost?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        let url = NSURL(string: post!.content_url!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension YMPostDetailViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        print(webView.stringByEvaluatingJavaScriptFromString("document.documentElement.innerHTML"))
    }
}
