//
//  UIImage+Extension.swift
//  weibo
//
//  Created by 晓佳 on 16/6/5.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit
extension UIImage {

    /**
     定义一个函数：根据颜色返回图片
     
     - parameter color: 颜色
     
     - returns: 返回图片
     */
    class func createAdtoImage(color:UIColor) ->UIImage {
        //在swfit中，结构体是按 值 传递， 而对象是 按 址 传递，结构体和对象在很多方面都非常像
        //在swift中，大部分的原生的数据类型，都是结构体
        
       //调用结构体的构造函数
        //let frame = CGSize(width: 200, height: 200)
        
        let size = CGSizeMake(1, 1)
        //创建图形上下文
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.mainScreen().scale)
        color.set()//设置颜色
        //设置填充区域
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        //从图形上下文中获得图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()//关闭图形上下文
        return image
        
    }
}
