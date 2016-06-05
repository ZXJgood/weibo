//
//  UIImageView+extention.swift
//  WeiboThree
//
//  Created by itheima on 16/6/5.
//  Copyright © 2016年 itheima. All rights reserved.
//

import UIKit

extension UIImageView {
    //1. 便利构造器前面要使用convenience修饰
    convenience init (imageName: String) {
        //2. 便利构造器，总是调用自己的指定构造器完成构造过程
        self.init()
        
        let image = UIImage(named: imageName)
        self.image = image
    }
}
