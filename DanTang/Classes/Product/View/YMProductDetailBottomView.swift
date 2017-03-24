//
//  YMProductDetailBottomView.swift
//  DanTang
//
//  Created by 杨蒙 on 16/7/27.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SnapKit

let commentCellID = "commentCellID"

class YMProductDetailBottomView: UIView, YMDetailChoiceButtonViewDegegate, UIWebViewDelegate, UITableViewDataSource {
    
    var comments = [YMComment]()
    
    var product: YMProduct? {
        didSet {
            weak var weakSelf = self
            /// 获取单品详细数据
            YMNetworkTool.shareNetworkTool.loadProductDetailData(id: product!.id!) { (productDetail) in
                weakSelf!.choiceButtonView.commentButton.setTitle("评论(\(productDetail.comments_count!))", for: .normal)
                weakSelf!.webView.loadHTMLString(productDetail.detail_html!, baseURL: nil)
            }
            /// 获取评论数据
            YMNetworkTool.shareNetworkTool.loadProductDetailComments(id: product!.id!) { (comments) in
                weakSelf!.comments = comments
                weakSelf!.tableView.reloadData()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        // 添加顶部选择按钮 view（图文介绍，评论）
        addSubview(choiceButtonView)
        
        addSubview(tableView)
        
        addSubview(webView)
        
        choiceButtonView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: SCREENW, height: 44))
            make.top.equalTo(self)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(choiceButtonView.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
        
        webView.snp.makeConstraints { (make) in
            make.top.equalTo(choiceButtonView.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    private lazy var webView: UIWebView = {
        let webView = UIWebView()
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        webView.delegate = self
        return webView
    }()
    
    private lazy var choiceButtonView: YMDetailChoiceButtonView = {
        let choiceButtonView = YMDetailChoiceButtonView.choiceButtonView()
        choiceButtonView.delegate = self
        return choiceButtonView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        let nib = UINib(nibName: String(describing: YMCommentCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: commentCellID)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 64
        return tableView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - YMDetailChoiceButtonViewDegegate
    func choiceIntroduceButtonClick() {
        tableView.isHidden = true
        webView.isHidden = false
    }
    
    func choicecommentButtonClick() {
        tableView.isHidden = false
        webView.isHidden = true
        
    }
    
    // MARK: - UIWebViewDelegate
    private func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    private func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: commentCellID) as! YMCommentCell
        cell.comment = comments[indexPath.row]
        return cell
    }
}
