//
//  woViewController.swift
//  oobase纯代码版
//
//  Created by 杨晶 on 16/3/23.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit


//我页面
class woViewController: UIViewController, NSURLConnectionDataDelegate {
    

    var 退出: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainSize = UIScreen.mainScreen().bounds.size
        退出 = UIButton(frame: CGRectMake(25, 100, mainSize.width - 50, 40))
        退出.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        退出.setTitle("退出", forState: UIControlState.Normal)
        退出.titleLabel?.font = UIFont.systemFontOfSize(30)
        退出.layer.cornerRadius = 5//设置圆角
        退出.backgroundColor = UIColor.redColor()//背景颜色
        退出.addTarget(self, action: #selector(woViewController.btn退出), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(退出)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
//        self.navigationController?.navigationBarHidden = true
        self.tabBarController?.tabBar.hidden = false//结合userinfo 的代码实现单独隐藏导航
    }

    func btn退出() {
        presentViewController(login1ViewController(), animated: false, completion: nil)//转回登陆界面
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
