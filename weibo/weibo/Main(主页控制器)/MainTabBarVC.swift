//
//  MainTabBarVC.swift
//  weibo
//
//  Created by 晓佳 on 16/6/2.
//  Copyright © 2016年 xiaojia. All rights reserved.
//


/*
extension 分类可以将相同逻辑的代码放到一个分类里，代码比较易度，层次清晰
class 里面放生命周期

*/

import UIKit

class MainTabBarVC: UITabBarController {
    let customBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置tabbar的渲染
        tabBar.tintColor = UIColor.orangeColor()
        
     addChildViewControllers()
    
    }
    
//extension MainTabBarVC {
    
        /**
         设置子控制器
         
         - parameter childVC:   子控制器
         - parameter title:     标题
         - parameter iconImage: 图片
         */
      private  func loadChileViewController(childVC:UIViewController,title:String,iconImage:String){
            let nav = MainNavVC(rootViewController:childVC)
            childVC.title = title
            let selectedImage = "\(iconImage)_selected"
            childVC.tabBarItem.image = UIImage(named: iconImage)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)
            addChildViewController(nav)
        }
        
      private  func addChildViewControllers () {
            //首页
            let home = HomeViewController()
            loadChileViewController(home, title: "首页", iconImage: "tabbar_home")
            //消息
            let message = MessageViewController()
            loadChileViewController(message, title: "消息", iconImage: "tabbar_message_center")
        
            //设置占位控制器
            let viewcontroller = UIViewController()
            loadChileViewController(viewcontroller, title: "", iconImage: "")
            //发现
            let discover = DiscoverViewController()
            loadChileViewController(discover, title: "发现", iconImage: "tabbar_discover")
            //我
            let mine = ProfileViewController()
            loadChileViewController(mine, title: "我的", iconImage: "tabbar_profile")
        }

    
    
//    }
    
    
   

}
