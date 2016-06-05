//
//  UILabel+extention.swift
//  WeiboThree
//
//  Created by itheima on 16/6/5.
//  Copyright © 2016年 itheima. All rights reserved.
//

import UIKit

//UILabel+extention.swift:13:14: Type of expression is ambiguous without more context:代表我们自己定义构造器和UILable自已的构造器有冲突
//
//extension UILabel {
//    convenience init(text: String = "hello, world") {
//        self.init()
//        self.text = text
//    }
//}
//
//let label = UILabel()

extension UILabel {
    /**
     
     
     - parameter text:          文本
     - parameter textColor:     文本颜色
     - parameter fontSize:      字体大小
     - parameter textAlignment: 文本属性
     - parameter numberOfLines: 换行
     
     - returns: 文本
     */
    convenience init(text: String,
        textColor: UIColor = UIColor.darkGrayColor(),
        fontSize: CGFloat = 12,
        textAlignment: NSTextAlignment = .Left,
        numberOfLines:Int = 0) {
            
            self.init()
            
            self.text = text ?? ""
            self.textColor = textColor
            self.font = UIFont.systemFontOfSize(fontSize)
            self.textAlignment = textAlignment
            self.numberOfLines = numberOfLines
    }
}
