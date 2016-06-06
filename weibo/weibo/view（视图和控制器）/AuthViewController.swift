//
//  AuthViewController.swift
//  weibo
//
//  Created by 晓佳 on 16/6/6.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit
class AuthViewController: UIViewController {
    lazy var webView = UIWebView()
    override func loadView() {
        view = webView
        webView.delegate = self//设置代理
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        loadWebView()//加载webview
    }
}
//MARK:-加载webview
extension AuthViewController {
    func loadWebView(){
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=3721913019&redirect_uri=https://www.baidu.com"
        let url = NSURL(string: urlStr)
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
    }
    
}

//MARK:-遵循代理，实现代理方法
extension AuthViewController: UIWebViewDelegate {
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}