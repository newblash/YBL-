//
//  SuperAdminViewController.swift
//  伊百丽(华容店)无纸化信息管理
//
//  Created by 杨晶 on 16/4/22.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class SuperAdminViewController: UIViewController, UITextFieldDelegate {
    
//    
//    var ybldata: YBLdata!
//
//    
    var name = UILabel()//账号标签
    var alert = SweetAlert()
    var nameTxt = UITextField()//账号输入框
    
    var addAccount = UIButton(type: UIButtonType.Custom)//添加业务员按钮
    var addType = UIButton(type: UIButtonType.ContactAdd)//添加类型
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
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
        
        name = UILabel(frame: CGRectMake(10, 90, 70, 30))
        name.text = "店员名:"
        self.view.addSubview(name)
        
        
        nameTxt = UITextField(frame: CGRectMake(name.frame.maxX + 10, name.frame.minY, mainSize.width - name.frame.maxX - 20, 30))
        nameTxt.layer.cornerRadius = 5
        nameTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        nameTxt.borderStyle = UITextBorderStyle.RoundedRect
        nameTxt.clearButtonMode = .Always
        nameTxt.autocapitalizationType = .None//首字母类型,默认关闭
        self.view.addSubview(nameTxt)
        
        
        
        addAccount = UIButton(frame: CGRectMake(x, y, w, h))
        addAccount.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        addAccount.setTitle("添加", forState: UIControlState.Normal)
        addAccount.titleLabel?.font = UIFont.systemFontOfSize(addAccount.frame.height/1.2)
        addAccount.layer.cornerRadius = 5//设置圆角
        addAccount.backgroundColor = UIColor.redColor()//背景颜色
        addAccount.addTarget(self, action: #selector(SuperAdminViewController.AddAccount), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(addAccount)
        }
    }
    
    func AddAccount() {
        print("添加账号")
                if nameTxt.text == ""{
                    alert.showAlert("警告", subTitle: "名字不能为空", style: AlertStyle.Warning)
                }else {
                    saveRecordToCloud()
                    alert.showAlert("友情提示", subTitle: "保存成功", style: AlertStyle.Success, buttonTitle: "确定", action: { (isOtherButton) in
                        self.presentViewController(TB1ViewController(), animated: true, completion: nil)//转场
            })
        }
    }
    
    func saveRecordToCloud() {

        let record = AVObject(className: "YBLclerk")
        record["name"] = self.nameTxt.text
        record.saveInBackgroundWithBlock { (_, e) in
            if let e = e {
                print(e.localizedDescription)
            } else {
                print("保存成功！")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{//设置键盘点击之后隐藏
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {//隐藏键盘的另一种方法
        nameTxt.resignFirstResponder()
    }

}
