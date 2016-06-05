//
//  HomeViewController.swift
//  weibo
//
//  Created by 晓佳 on 16/6/2.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit
private var identifier = "cell"
class HomeViewController: rootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        
        //在每一个子模块中，使用的自定义cell可能不一样
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        //设置visitorView
        visitorView?.setVistitorView("关注一些人，回这里看看有什么惊喜", icon: "visitordiscover_feed_image_house", isHome: true)
    }
}

extension HomeViewController {
    override func loadData() {
        
        if ispullUp {
            
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC)))
            
            self.footRefreshControl.startAnimating()
            dispatch_after(delay, dispatch_get_main_queue()) {
                
                let end = (self.dataArray.last ?? 981) - 1
                let from = end - 19
                
                var requestArray: [Int] = []
                
                for i in (from...end).reverse() {
                    requestArray.append(i)
                }
                
                self.dataArray += requestArray
                
                self.footRefreshControl.stopAnimating()
                self.tableView.reloadData()
                
                self.ispullUp = false
            }
            
        } else {
            
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC)))
            
            dispatch_after(delay, dispatch_get_main_queue()) {
                //模拟下拉刷新的数据
                let from = (self.dataArray.first ?? 1000) + 1
                let end = from + 19
                
                var requestArray: [Int] = []
                
                for i in (from...end).reverse() {
                    requestArray.append(i)
                }
                
                self.dataArray = requestArray + self.dataArray
                self.refreshControl.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
}
//MARK:-实现数据源方法
extension HomeViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell.textLabel?.text = "\(dataArray[indexPath.row])"
        
        return cell
    }
}

//MARK:-实现代理方法
extension HomeViewController{
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //如果是最后一行，就执行上拉刷新的操作
        if indexPath.row == dataArray.count - 1 {
            ispullUp = true
            loadData()
        }
    }
}