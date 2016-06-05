//
//  UIButton+extention.swift
//  weibo
//
//  Created by 晓佳 on 16/6/5.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

//写UIButton的便利构造器
import UIKit

//存放同一个功能的代码
extension UIButton {
    //便利构造器要用convenience关键字开头
    //在定义swift的函数时，如果函数的参数有可能在某个时间被设为nil，或者有可能被传一个nil，则将该参数设为可选。
    convenience init(title:String,
                titleColor: UIColor = UIColor.darkGrayColor(),
                      font: CGFloat = 12,
                     image: String? = nil,
           backGroundImage: String? = nil,
                    target: AnyObject? = nil,
                    action: String? = nil,
                     event: UIControlEvents = .TouchUpInside){
        //一般self使用在闭包当中
     self.init()
    
        self.setTitle(title as String, forState: .Normal)
        self.setTitleColor(titleColor, forState: .Normal)
        
        self.titleLabel?.font = UIFont.systemFontOfSize(font)
        
        //设置图片
        if let image = image {
                self.setImage(UIImage(named: image), forState: .Normal)
                self.setImage(UIImage(named: "\(image)_highlighted"), forState: .Highlighted)
                        }
        //设置背景图片
        if let backGroundimage = backGroundImage {
                self.setBackgroundImage(UIImage(named: backGroundimage), forState: .Normal)
                self.setBackgroundImage(UIImage(named: "\(backGroundImage)_highlighted"), forState: .Highlighted)
                        }
        //action如果直接写，可以直接用字符串，如果作为参数传递，必须使用 selector
        //添加点击事件
        let selector = Selector(action!)
        self.addTarget(target, action: selector, forControlEvents: event)
    
    }
}