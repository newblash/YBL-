//
//  TBViewController.swift
//
//  Created by 杨晶 on 16/3/28.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

//导航控制器
class TB1ViewController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let huoban = kehu1TableViewController()
        huoban.title = "客户"
        let add = SuperAdminViewController()
        add.title = "添加店员"
        let clerk = clerkTableViewController()
        clerk.title = "店员"
        
        
        //分别声明视图控制器
        let 客户 = UINavigationController(rootViewController:huoban)
        客户.tabBarItem = UITabBarItem(title: "客户", image: UIImage(named: "huoban")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "huobanHL")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        
        let 店员 = UINavigationController(rootViewController:clerk)
        店员.tabBarItem = UITabBarItem(title: "店员", image: UIImage(named: "wo")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "woHL")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        
        let 添加 = UINavigationController(rootViewController:add)
        添加.tabBarItem = UITabBarItem(title: "添加店员", image: UIImage(named: "wo")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "woHL")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        
        self.viewControllers = [客户,店员,添加]
        
        //        UITabBar.appearance().tintColor = UIColor.clearColor()//设置导航条背景
        //默认选中的视图
        self.selectedIndex = 0
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
