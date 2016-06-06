//
//  MainNavVC.swift
//  weibo
//
//  Created by 晓佳 on 16/6/2.
//  Copyright © 2016年 xiaojia. All rights reserved.
//

import UIKit

class rootViewController: UIViewController{
    //是否登录
    var isLogin = false
    
    //访客视图
    var visitorView: VisotorView?
    
    //tableView
    lazy var tableView: UITableView = UITableView()
    
    //是否是上拉
    var ispullUp: Bool = false
    
    //下拉刷新控件
    lazy var refreshControl: UIRefreshControl = UIRefreshControl()
    
    //上拉刷新控件
    lazy var footRefreshControl: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    //MARK:-懒加载数据
    lazy var dataArray: [Int] = {
        var array: [Int] = []
        for i in (981...1000).reverse() {
            array.append(i)
        }
        return array
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.frame = view.bounds
    }
}

//MARK:-设置UI
extension rootViewController {
    func setupView() {
        view.backgroundColor = UIColor.whiteColor()
        setupTableView()
        setupRefresh()
        
        if (!isLogin){ //是否登录
         setupVisotorView() //设置访客视图
        }
    }
    func setupTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    //设置刷新
    func setupRefresh() {
        //下拉刷新
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: "loadData", forControlEvents: .ValueChanged)
        
        //上拉刷新
        tableView.tableFooterView = footRefreshControl
    }
    //实现访客视图
    func setupVisotorView() {
       visitorView = VisotorView()
        visitorView?.delegate = self//设置代理对象
       view.addSubview(visitorView!)
    }
}


extension rootViewController {
    func loadData(){
    
    }

}

//MARK:-实现数据源方法
extension rootViewController:UITableViewDataSource  {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("customCell")
        if cell == nil
        {
          cell = UITableViewCell(style: .Default, reuseIdentifier: "customCell")
        }
//        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }
}

//MARK:-实现代理方法
extension rootViewController:UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //当某一行的cell将要显示的时候，会执行该方法
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    }
}

//实现VisitorDelegate代理方法
extension rootViewController:VisitorDelegate {
    func didlogin() {
        let authViewController = AuthViewController()
        let naviagetionController = UINavigationController(rootViewController: authViewController)
        presentViewController(naviagetionController, animated: true, completion: nil)
    }

}