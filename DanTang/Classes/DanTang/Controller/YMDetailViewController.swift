//
//  YMDetailViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/20.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SVProgressHUD

class YMDetailViewController: YMBaseViewController,UIWebViewDelegate {

    var homeItem: YMHomeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = UIWebView()
        webView.frame = view.bounds
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        let url = NSURL(string: homeItem!.content_url!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        webView.delegate = self
        view.addSubview(webView)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        print(webView.stringByEvaluatingJavaScriptFromString("document.documentElement.innerHTML"))
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
