//
//  MainTabBarVC.swift
//  weibo
//
//  Created by 晓佳 on 16/6/2.
//  Copyright © 2016年 xiaojia. All rights reserved.
//


/*
extension 分类可以将相同逻辑的代码放到一个分类里，代码比较易读，层次清晰
class 里面放生命周期方法，构造方法，属性

*/

import UIKit
//class只放生命周期方法，构造方法，属性
class MainTabBarVC: UITabBarController {

    //action如果有参数，需要在方法名后面加冒号，一个参数就加一个：两个加两个：
    //懒加载（加号按钮属性） ---使用按钮的构造便利器
    private lazy var customBtn: UIButton = UIButton(title: "",  image: "tabbar_compose_icon_add", backGroundImage: "tabbar_compose_button", target: self, action: "compose:", event: .TouchUpInside)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置tabbar的渲染
        tabBar.tintColor = UIColor.orangeColor()
        
        addChildViewControllers()//添加子控制器
        setUpAddBtn()//设置加好按钮
        settabbar()//设置tabbar
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //print("===================\n\(tabBar.subviews)")
        tabBar.bringSubviewToFront(customBtn)
    }
}


//extension可以将相同逻辑的代码放到一个分类里，代码易读，层次相对清晰
extension MainTabBarVC {
    //MARK:-设置加好按钮的位置
    private func setUpAddBtn (){
        //添加到tabbar上
        self.tabBar.addSubview(customBtn)
//        //计算按钮的宽度
//        let width = tabBar.bounds.width/CGFloat(viewControllers!.count)
//        //创建按钮frame
//        let rect = CGRect(x: 0, y: 0, width: width, height: tabBar.bounds.height)
//        //设置按钮frame和pianyiwei
//        customBtn.frame = CGRectOffset(rect, width * 2, 0)
        
        
        //根据一个frame，向内或向外生成一个新的frame
        let tabBarItemWidth = tabBar.bounds.size.width/5
        let custombtn = CGRectInset(tabBar.bounds, tabBarItemWidth*2, 0)
        customBtn.frame = custombtn

        
    }
//MARK: - 设置子控制器
/*
- parameter childVC:   子控制器
- parameter title:     标题
- parameter iconImage: 图片
*/
    private  func loadChileViewController(childVC:UIViewController,title:String,iconImage:String?){
    let nav = UINavigationController(rootViewController:childVC)
    childVC.title = title
        
    if let iconImage = iconImage {
    let selectedImage = "\(iconImage)_selected"
    childVC.tabBarItem.image = UIImage(named: iconImage)?.imageWithRenderingMode(.AlwaysOriginal)
    childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.imageWithRenderingMode(.AlwaysOriginal)
        }
    
    addChildViewController(nav)
}

//MARK: - 添加子控制器
    private  func addChildViewControllers () {
    //首页
    let home = HomeViewController()
    loadChileViewController(home, title: "首页", iconImage: "tabbar_home")
    //消息
    let message = MessageViewController()
    loadChileViewController(message, title: "消息", iconImage: "tabbar_message_center")
    //设置占位控制器
    let vc = UIViewController()
    loadChileViewController(vc, title: "", iconImage: nil)
    
       //发现
    let discover = DiscoverViewController()
    loadChileViewController(discover, title: "发现", iconImage: "tabbar_discover")
    //我
    let mine = ProfileViewController()
    loadChileViewController(mine, title: "我的", iconImage: "tabbar_profile")
}
    
    //MARK:-设置tabbar
    private func settabbar() {
        tabBar.backgroundImage = UIImage(named: "tabbar_background")
        tabBar.shadowImage = UIImage.createAdtoImage(UIColor(white: 0.9, alpha: 1.0))
    }
    
    //MARK:-加好按钮的点击事件
     //注意：运行循环监听到事件后，向控制器发送消息，动态执行方法，因此不能设置为private
     func compose(button:UIButton) {
        print("+按钮发布");
    }

}


