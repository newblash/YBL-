//
//  TB2ViewController.swift
//  伊百丽(华容店)无纸化信息管理
//
//  Created by 杨晶 on 16/4/25.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class TB2ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let huoban = kehu2TableViewController()
        huoban.title = "客户"
        let wo = wo2ViewController()
        wo.title = "我"
        
        
        //分别声明视图控制器
        let 客户 = UINavigationController(rootViewController:huoban)
        客户.tabBarItem = UITabBarItem(title: "客户", image: UIImage(named: "huoban")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "huobanHL")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let 我 = UINavigationController(rootViewController:wo)
        我.tabBarItem = UITabBarItem(title: "我", image: UIImage(named: "wo")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "woHL")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        self.viewControllers = [客户,我]
        
        //        UITabBar.appearance().tintColor = UIColor.clearColor()//设置导航条背景
        //默认选中的视图
        self.selectedIndex = 0
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
