//
//  VisotorView.swift
//  weibo
//
//  Created by 晓佳 on 16/6/5.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit
import SnapKit
//在swfit中定义代理
//
//swfit中定义某种类型

//class Person {
//
//}
//
//struct CARect {
//
//}
//
//enum Request {
//
//}
//设置代理协议和方法
protocol VisitorDelegate {
    func didlogin();
}

class VisotorView: UIView {
    
    var delegate:VisitorDelegate?//设置代理属性
    
    //添加子控件： 从上往下，从左往右
    //图标
    //lazy var 的属性最好在定义的时候指定一下数据类型
    lazy var iconView: UIImageView = UIImageView(imageName: "visitordiscover_feed_image_house")
    
    //转圈图片
    lazy var circleView: UIImageView = UIImageView(imageName: "visitordiscover_feed_image_smallicon")
    
    //遮罩图片
    lazy var maskIconView: UIImageView = UIImageView(imageName: "visitordiscover_feed_mask_smallicon")
    
    //文字label
    lazy var textLabel: UILabel = UILabel(text: "登录后，别人评论你的微博，给你发送消息，你都会收到", textAlignment: .Center)
    
    //注册按钮
    lazy var registButton: UIButton = UIButton(title: "注册",
        titleColor: UIColor.orangeColor(),
        font: 14,
        backGroundImage: "common_button_white_disable",
        target: self,
        action: "regist:")
    
    //登录按钮
    lazy var loginButton: UIButton = UIButton(title: "登录",
        titleColor: UIColor.darkGrayColor(),
        font: 14,
        backGroundImage: "common_button_white_disable",
        target: self,
        action: "login:")
    
    
    
    //访客视图的构造函数
    init() {
        super.init(frame: UIScreen.mainScreen().bounds)
        setupUI()
    }
    
    //required，如果说父类定义一个函数，使用 required修饰，则子类必须重写该方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VisotorView {
    
    
    func setVistitorView(title: String, icon: String, isHome: Bool = false) {
        textLabel.text = title
        iconView.image = UIImage(named: icon)
        if isHome {
            circleView.hidden = false
            maskIconView.hidden = false
        }
    }
    
    /**
     添加转圈动画
     */
    func addAnimation () {
        //transform.rotation 代表旋转
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        //动画执行一次的时间
        animation.duration = 15
        //2 * M_PI 代表360度旋转
        animation.toValue = 2 * M_PI
        //动动重复次数
        animation.repeatCount = MAXFLOAT
        //是否执行完成之后移除动画
        animation.removedOnCompletion = false
        //将动画添加到view上。
        circleView.layer.addAnimation(animation, forKey: nil)
    }
    
    //自动布局，添加子控件，给子控件设置初始值
    func setupUI() {
        backgroundColor = UIColor(white: 237/255.0, alpha: 1.0)

        //将控件添加到访客视图上
        addSubview(iconView)
        addSubview(circleView)
        addSubview(maskIconView)
        addSubview(textLabel)
        addSubview(registButton)
        addSubview(loginButton)

        //对于多数而言，如果设置相同，应该设为默认值，而只对少数做处理
        circleView.hidden = true
        maskIconView.hidden = true
        
        //自动布局
        //masonry是oc当中自动布局的框架。snapkit，是masonry公司出的，专门用于swift自动布局的框架。
        //1. 自动布从上到下，从左到右依次布局
        //2. 每写完一个控件的自动布局，需要运行一下，看看效果，不要所有控件全部写完再看效果。
        //3. 对于可能被拉伸或者宽高可能动态调整的控件，如果将其作为参照，需要特别留意。
        //4. 不要忘了写参照控件的参照属性
        iconView.snp_makeConstraints {
            (make) -> Void in
            make.centerY.equalTo(self).offset(-100)
            make.centerX.equalTo(self)
        }
        circleView.snp_makeConstraints { (make) -> Void in
           make.center.equalTo(iconView)
        }
        //maskIconview有可能被拉伸
        maskIconView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(circleView)
            make.centerY.equalTo(circleView).offset(45)
            make.width.equalTo(self)
        }
        textLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(circleView)
            make.centerY.equalTo(circleView.snp_bottom).offset(50)
            make.left.equalTo(self).offset(50)
            make.right.equalTo(self).offset(-50)
        }
        
        registButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(80)
            make.centerY.equalTo(circleView.snp_bottom).offset(120)
            make.width.equalTo(100)
        }
        
        loginButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-80)
            make.centerY.equalTo(circleView.snp_bottom).offset(120)
            make.width.equalTo(100)
        }
        
        addAnimation()
    
    }

}

extension VisotorView {
    func regist (button: UIButton) {
        print("注册")
    }
    
    func login (button: UIButton) {
        print("登录")
        delegate?.didlogin()
    }
}

