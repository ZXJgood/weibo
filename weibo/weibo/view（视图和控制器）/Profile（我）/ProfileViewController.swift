//
//  ProfileViewController.swift
//  weibo
//
//  Created by 晓佳 on 16/6/2.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit

class ProfileViewController: rootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置visitorView
        visitorView?.setVistitorView("登录后，最新，最热微博都会在这里展示，不会与最新潮流擦肩而过", icon: "visitordiscover_image_message")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
