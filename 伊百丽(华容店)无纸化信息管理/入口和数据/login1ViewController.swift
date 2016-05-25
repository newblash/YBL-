//
//  login1ViewController.swift
//  YBL数据管理
//
//  Created by 杨晶 on 16/5/17.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class login1ViewController: UIViewController {

    var btn = UIButton(type: UIButtonType.Custom)
    var btn1 = UIButton(type: UIButtonType.Custom)
    var btn2 = UIButton(type: UIButtonType.Custom)
    var alert = SweetAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.grayColor()
        
        let mainSize = UIScreen.mainScreen().bounds.size
        var w: CGFloat!
        var h: CGFloat!
        var x: CGFloat!
        var y: CGFloat!
        if mainSize.width > 320{
            w = 400
            h = 40
            x = mainSize.width/2 - w/2
            y = mainSize.height/2
        }else{
            w = mainSize.width - 50
            h = 40
            x = 25
            y = mainSize.height/2
        }
        
        btn = UIButton(frame: CGRectMake(x,y - 60,w,h))
        btn.backgroundColor = UIColor.greenColor()
        btn.layer.cornerRadius = 5
        btn.setTitle("业务员", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(login1ViewController.btn_), forControlEvents: .TouchUpInside)
        view.addSubview(btn)
        
        btn1 = UIButton(frame: CGRectMake(x,y,w,h))
        btn1.backgroundColor = UIColor.yellowColor()
        btn1.layer.cornerRadius = 5
        btn1.setTitle("设计师", forState: UIControlState.Normal)
        btn1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn1.addTarget(self, action: #selector(login1ViewController.btn_1), forControlEvents: .TouchUpInside)
        view.addSubview(btn1)
        
        btn2 = UIButton(frame: CGRectMake(x,y + 60,w,h))
        btn2.backgroundColor = UIColor.redColor()
        btn2.layer.cornerRadius = 5
        btn2.setTitle("管理员", forState: UIControlState.Normal)
        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn2.addTarget(self, action: #selector(login1ViewController.btn_2), forControlEvents: .TouchUpInside)
        view.addSubview(btn2)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btn_(){
        alert.showAlert("业务员你好!", subTitle: "欢迎使用本软件", style: AlertStyle.Success, buttonTitle: "前往客户界面") { (isOtherButton) in
            self.presentViewController(TB2ViewController(), animated: true, completion: nil)
        }
    }
    
    func btn_1(){
        alert.showAlert("设计师你好!", subTitle: "欢迎使用本软件", style: AlertStyle.Success, buttonTitle: "前往客户界面") { (isOtherButton) in
            self.presentViewController(TBViewController(), animated: true, completion: nil)
        }
    }
    func btn_2(){
        alert.showAlert("管理员你好!", subTitle: "欢迎使用本软件", style: AlertStyle.Success, buttonTitle: "前往管理员界面") { (isOtherButton) in
            self.presentViewController(TB1ViewController(), animated: true, completion: nil)
            
        }
    }
    
    //状态栏高亮状态
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
