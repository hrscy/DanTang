//
//  YMTMALLViewController.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/23.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  去天猫购买
//

import UIKit

class YMTMALLViewController: YMBaseViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var product: YMProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        let url = URL(string: product!.purchase_url!)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
    private func setupNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(shareBBItemClick))
    }
    
    func shareBBItemClick() {
        YMActionSheet.show()
    }
    
    func navigationBackClick() {
        dismiss(animated: true, completion: nil)
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

