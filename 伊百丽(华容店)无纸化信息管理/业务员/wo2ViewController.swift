//
//  wo2ViewController.swift
//  伊百丽(华容店)无纸化信息管理
//
//  Created by 杨晶 on 16/4/25.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class wo2ViewController: UIViewController {

    var 退出: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        let mainSize = UIScreen.mainScreen().bounds.size
        
        退出 = UIButton(frame: CGRectMake(10, 90, mainSize.width - 20, 30))
        退出.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        退出.setTitle("退出", forState: UIControlState.Normal)
        退出.titleLabel?.font = UIFont.systemFontOfSize(mainSize.width/20)
        退出.layer.cornerRadius = 5//设置圆角
        退出.backgroundColor = UIColor.redColor()//背景颜色
        退出.addTarget(self, action: #selector(wo2ViewController.back), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(退出)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func back() {
        presentViewController(login1ViewController(), animated: false, completion: nil)
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
