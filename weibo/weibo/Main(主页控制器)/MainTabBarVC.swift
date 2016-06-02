//
//  MainTabBarVC.swift
//  weibo
//
//  Created by 晓佳 on 16/6/2.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

     addChildViewControllers()
    }
    
    func loadChileViewController(childVC:UIViewController,title:String,iconImage:String){
        let nav = MainNavVC(rootViewController:childVC)
        childVC.title = title
        let selectedImage = "\(iconImage)_selected"

        let selectIcon = UIImage(named:selectedImage)
        selectIcon?.imageWithRenderingMode(.AlwaysOriginal)
        childVC.tabBarItem.image = UIImage(named: iconImage)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.imageWithRenderingMode(.AlwaysOriginal)
        addChildViewController(nav)
    }
    
    func addChildViewControllers () {
        //首页
      let home = HomeViewController()
       loadChileViewController(home, title: "首页", iconImage: "tabbar_home")
        //消息
        let message = MessageViewController()
        loadChileViewController(message, title: "消息", iconImage: "tabbar_message_center")
        //发现
        let discover = DiscoverViewController()
        loadChileViewController(discover, title: "发现", iconImage: "tabbar_discover")
        //我
        let mine = ProfileViewController()
        loadChileViewController(mine, title: "我的", iconImage: "tabbar_profile")
    }
    
   

}
