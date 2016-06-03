//
//  MainNavVC.swift
//  weibo
//
//  Created by 晓佳 on 16/6/2.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit

class rootViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    //MARK:-懒加载数据
    lazy var dateArray:[String] = {
        return ["jacl","hello","tom"]
    }()
}
//MARK:-实现数据源代理方法
extension rootViewController:UITableViewDelegate,UITableViewDataSource  {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("customCell")
        if cell == nil
        {
          cell = UITableViewCell(style: .Default, reuseIdentifier: "customCell")
        }
        cell?.textLabel?.text = dateArray[indexPath.row]
        return cell!
    }

}