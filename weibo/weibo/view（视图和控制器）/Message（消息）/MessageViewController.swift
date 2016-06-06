//
//  MessageViewController.swift
//  weibo
//
//  Created by 晓佳 on 16/6/2.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit

class MessageViewController: rootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置visitorView
        visitorView?.setVistitorView("关注一些人，回这里看看有什么惊喜", icon: "visitordiscover_image_profile")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
