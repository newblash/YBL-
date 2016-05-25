//
//  AddKeHuViewController.swift
//  伊百丽(华容店)无纸化信息管理
//
//  Created by 杨晶 on 16/4/25.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class kehuInfo1ViewController: UIViewController, UITextFieldDelegate{
    
    
    var name1: String!
    var address1: String!
    var phone1: String!
    var style1: String!
    var color1: String!
    var descr1: String!
    var addTime1: NSDate!
    var timeFormatter = NSDateFormatter()
    
    var BusinessManager1: String!
    var measuerHouse1: String!
    var designer1: String!
    var projectDesigin1: String!
    var trasactionPrice1: String!
    var budget1: String!
    var objectID: String!
    
    var info1: String!
    
    
    
    
    var name = UILabel()//客户姓名
    var name2 = UILabel()
    var address = UILabel()//客户地址
    var address2 = UILabel()//客户地址
    var phone = UILabel()//客户手机
    var phone2 = UILabel()//客户手机
    var style = UILabel()//风格-选项
    var style2 = UILabel()//风格-选项
    var color = UILabel()//颜色-选项
    var color2 = UILabel()//颜色-选项
    var descr = UILabel()//备注框
    var addTime = UILabel()//添加日期-自动获取
    var addTime2 = UILabel()//添加日期-自动获取
    var BusinessManager = UILabel()//客户经理-选项
    var BusinessManager2 = UILabel()//客户经理-选项
    var measuerHouse = UILabel()//量房-选项
    var measuerHouse2 = UILabel()//量房-选项
    var designer = UILabel()//设计师-选项
    var designer2 = UILabel()//设计师-选项
    var projectDesigin = UILabel()//项目是否完成-选项
    var projectDesigin2 = UILabel()//项目是否完成-选项
    var trasactionPrice = UILabel()//成交价格
    var trasactionPrice2 = UILabel()//成交价格
    var budget = UILabel()//预算价格
    var budget2 = UILabel()//预算价格
    var info = UILabel()//最后的警告信息
    
    //    var nameTxt = UITextField()//姓名
    //    var addressTxt = UITextField()//地址
    //    var phoneTxt = UITextField()//手机
    //    var styleTxt = UITextField()//风格
    //    var colorTxt = UITextField()//颜色
    var descrTxt = UITextView()//备注
    //    var addTimeTxt = UITextField()//日期
    //    var BusinessManagerTxt = UITextField()//客户经理
    //    var measuerHouseTxt = UITextField()//量房
    //    var designerTxt = UITextField()//设计师
    //    var projectDesiginTxt = UITextField()//方案
    //    var budgetTxt = UITextField()//预算价格
    var trasactionPriceTxt = UITextField()//成交价格
    
    
//        var add = UIButton(type: UIButtonType.Custom)//添加客户按钮
//        var styleType = UIButton(type: UIButtonType.Custom)//添加风格
//        var colorType = UIButton(type: UIButtonType.Custom)//添加颜色
//        var BusinessManagerType = UIButton(type: UIButtonType.Custom)//添加客户经理
        var measuerHouseType = UIButton(type: UIButtonType.Custom)//添加量房人员
        var designerType = UIButton(type: UIButtonType.Custom)//添加设计师
        var projectDesiginType = UIButton(type: UIButtonType.Custom)//添加是否设计完成
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         timeFormatter.dateFormat = "yyy-MM-dd"
        let addTimeShow = timeFormatter.stringFromDate(addTime1) as String
        
        view.backgroundColor = UIColor.whiteColor()
        let mainSize = UIScreen.mainScreen().bounds.size
        navigationItem.title = "客户详细信息"
        let item = UIBarButtonItem(title: "更新", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(kehuInfo1ViewController.update))
        
        navigationItem.setRightBarButtonItem(item, animated: true)
        
        name = UILabel(frame: CGRectMake(10, 70, 80, 20))
        name.text = "客户:"
        name.sizeToFit()
        name.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(name)
        name2 = UILabel(frame: CGRectMake(name.frame.maxX , name.frame.minY, mainSize.width - name.frame.maxX - 20, 20))
        name2.text = name1
        name2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(name2)
        
        address = UILabel(frame: CGRectMake(10, name.frame.maxY + 10, 80, 20))
        address.text = "地址:"
        address.sizeToFit()
        address.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(address)
        address2 = UILabel(frame: CGRectMake(address.frame.maxX , address.frame.minY, mainSize.width - address.frame.maxX - 20, 20))
        address2.text = address1
        address2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(address2)
        
        phone = UILabel(frame: CGRectMake(10, address.frame.maxY + 10, 80, 20))
        phone.text = "电话:"
        phone.sizeToFit()
        phone.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(phone)
        phone2 = UILabel(frame: CGRectMake(phone.frame.maxX , phone.frame.minY, mainSize.width - phone.frame.maxX - 20, 20))
        phone2.text = phone1
        phone2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(phone2)
        
        style = UILabel(frame: CGRectMake(10, phone.frame.maxY + 10, 80, 20))
        style.text = "风格:"
        style.sizeToFit()
        style.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(style)
        style2 = UILabel(frame: CGRectMake(style.frame.maxX , style.frame.minY, mainSize.width - style.frame.maxX - 20, 20))
        style2.text = style1
        style2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(style2)
        //        styleType = UIButton(frame: CGRectMake(styleTxt.frame.maxX + 10, styleTxt.frame.minY, 80, 20))
        //        styleType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        //        styleType.setTitle("选择风格", forState: UIControlState.Normal)
        //        styleType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.2)
        //        styleType.layer.cornerRadius = 5//设置圆角
        //        styleType.backgroundColor = UIColor.blueColor()//背景颜色
        //        styleType.addTarget(self, action: #selector(AddKeHuViewController.AddStyle), forControlEvents: .TouchUpInside)//按钮事件
        //        self.view.addSubview(styleType)
        
        color = UILabel(frame: CGRectMake(10, style.frame.maxY + 10, 80, 20))
        color.text = "颜色:"
        color.sizeToFit()
        color.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(color)
        address2 = UILabel(frame: CGRectMake(address.frame.maxX , address.frame.minY, mainSize.width - address.frame.maxX - 20, 20))
        address2.text = address1
        address2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(address2)
        
        //        colorType = UIButton(frame: CGRectMake(colorTxt.frame.maxX + 10, colorTxt.frame.minY, 80, 20))
        //        colorType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        //        colorType.setTitle("选择颜色", forState: UIControlState.Normal)
        //        colorType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.2)
        //        colorType.layer.cornerRadius = 5//设置圆角
        //        colorType.backgroundColor = UIColor.blueColor()//背景颜色
        //        colorType.addTarget(self, action: #selector(AddKeHuViewController.AddColor), forControlEvents: .TouchUpInside)//按钮事件
        //        self.view.addSubview(colorType)
        
        addTime = UILabel(frame: CGRectMake(10, color.frame.maxY + 10, 80, 20))
        addTime.text = "日期:"
        addTime.sizeToFit()
        addTime.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(addTime)
        addTime2 = UILabel(frame: CGRectMake(addTime.frame.maxX , addTime.frame.minY, mainSize.width - addTime.frame.maxX - 20, 20))
        addTime2.text = addTimeShow
        addTime2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(addTime2)
        
        BusinessManager = UILabel(frame: CGRectMake(10, addTime.frame.maxY + 10, 80, 20))
        BusinessManager.text = "客户经理:"
        BusinessManager.sizeToFit()
        BusinessManager.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(BusinessManager)
        BusinessManager2 = UILabel(frame: CGRectMake(BusinessManager.frame.maxX , BusinessManager.frame.minY, mainSize.width - BusinessManager.frame.maxX - 20, 20))
        BusinessManager2.text = BusinessManager1
        BusinessManager2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(BusinessManager2)
        
        //        BusinessManagerType = UIButton(frame: CGRectMake(BusinessManagerTxt.frame.maxX + 10, BusinessManagerTxt.frame.minY, 80, 20))
        //        BusinessManagerType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        //        BusinessManagerType.setTitle("客户经理", forState: UIControlState.Normal)
        //        BusinessManagerType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.2)
        //        BusinessManagerType.layer.cornerRadius = 5//设置圆角
        //        BusinessManagerType.backgroundColor = UIColor.blueColor()//背景颜色
        //        BusinessManagerType.addTarget(self, action: #selector(AddKeHuViewController.AddBusinessManager), forControlEvents: .TouchUpInside)//按钮事件
        //        self.view.addSubview(BusinessManagerType)
        
        measuerHouse = UILabel(frame: CGRectMake(10, BusinessManager.frame.maxY + 10, 80, 20))
        measuerHouse.text = "量房:"
        measuerHouse.sizeToFit()
        measuerHouse.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(measuerHouse)
        measuerHouse2 = UILabel(frame: CGRectMake(measuerHouse.frame.maxX , measuerHouse.frame.minY, mainSize.width - measuerHouse.frame.maxX - 100, 20))
        measuerHouse2.text = measuerHouse1
        measuerHouse2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(measuerHouse2)
        
                measuerHouseType = UIButton(frame: CGRectMake(measuerHouse2.frame.maxX + 10, measuerHouse2.frame.minY, 80, 20))
                measuerHouseType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
                measuerHouseType.setTitle("量房人员", forState: UIControlState.Normal)
                measuerHouseType.titleLabel?.font = UIFont.systemFontOfSize(measuerHouseType.frame.height/1.5)
                measuerHouseType.layer.cornerRadius = 5//设置圆角
                measuerHouseType.backgroundColor = UIColor.blueColor()//背景颜色
//                measuerHouseType.userInteractionEnabled = false//让按钮不可用
                measuerHouseType.addTarget(self, action: #selector(AddKeHuViewController.AddmeasuerHouse), forControlEvents: .TouchUpInside)//按钮事件
                self.view.addSubview(measuerHouseType)
        
        designer = UILabel(frame: CGRectMake(10, measuerHouse.frame.maxY + 10, 80, 20))
        designer.text = "设计师:"
        designer.sizeToFit()
        designer.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(designer)
        designer2 = UILabel(frame: CGRectMake(designer.frame.maxX , designer.frame.minY, mainSize.width - designer.frame.maxX - 100, 20))
        designer2.text = designer1
        designer2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(designer2)
                designerType = UIButton(frame: CGRectMake(designer2.frame.maxX + 10, designer2.frame.minY, 80, 20))
                designerType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
                designerType.setTitle("设计师", forState: UIControlState.Normal)
                designerType.titleLabel?.font = UIFont.systemFontOfSize(designerType.frame.height/1.5)
                designerType.layer.cornerRadius = 5//设置圆角
                designerType.backgroundColor = UIColor.blueColor()//背景颜色灰色
//                designerType.userInteractionEnabled = false//让按钮不可用
                designerType.addTarget(self, action: #selector(AddKeHuViewController.Adddesigner), forControlEvents: .TouchUpInside)//按钮事件
                self.view.addSubview(designerType)
        
        projectDesigin = UILabel(frame: CGRectMake(10, designer.frame.maxY + 10, 80, 20))
        projectDesigin.text = "方案:"
        projectDesigin.sizeToFit()
        projectDesigin.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(projectDesigin)
        projectDesigin2 = UILabel(frame: CGRectMake(projectDesigin.frame.maxX , projectDesigin.frame.minY, mainSize.width - projectDesigin.frame.maxX - 100, 20))
        projectDesigin2.text = projectDesigin1
        projectDesigin2.font = UIFont(name: "Courier-Bold", size: 14)
        view.addSubview(projectDesigin2)
        
                projectDesiginType = UIButton(frame: CGRectMake(projectDesigin2.frame.maxX + 10, projectDesigin2.frame.minY, 80, 20))
                projectDesiginType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
                projectDesiginType.setTitle("提交方案", forState: UIControlState.Normal)
                projectDesiginType.titleLabel?.font = UIFont.systemFontOfSize(projectDesiginType.frame.height/1.2)
                projectDesiginType.layer.cornerRadius = 5//设置圆角
                projectDesiginType.backgroundColor = UIColor.blueColor()//背景颜色
//                projectDesiginType.userInteractionEnabled = false//让按钮不可用
                projectDesiginType.addTarget(self, action: #selector(AddKeHuViewController.AddprojectDesigin), forControlEvents: .TouchUpInside)//按钮事件
                self.view.addSubview(projectDesiginType)
        
//        budget = UILabel(frame: CGRectMake(10, projectDesigin.frame.maxY + 10, 80, 20))
//        budget.font = UIFont(name: "System", size: 14)
//        budget.text = "预算价格:"
//        budget.sizeToFit()
//        budget.font = UIFont(name: "Courier-Bold", size: 14)
//        self.view.addSubview(budget)
//        budget2 = UILabel(frame: CGRectMake(budget.frame.maxX , budget.frame.minY, mainSize.width - budget.frame.maxX - 20, 20))
//        budget2.text = budget1
//        budget2.font = UIFont(name: "Courier-Bold", size: 14)
//        view.addSubview(budget2)
        
        trasactionPrice = UILabel(frame: CGRectMake(10, projectDesigin.frame.maxY + 10, 80, 20))
        trasactionPrice.text = "成交价格:"
        trasactionPrice.sizeToFit()
        trasactionPrice.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(trasactionPrice)

        trasactionPriceTxt = UITextField(frame: CGRectMake(trasactionPrice.frame.maxX + 10, trasactionPrice.frame.minY, mainSize.width - trasactionPrice.frame.maxX - 20, 25))
        trasactionPriceTxt.text = trasactionPrice1
        trasactionPriceTxt.layer.cornerRadius = 5
        trasactionPriceTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        trasactionPriceTxt.borderStyle = UITextBorderStyle.RoundedRect
        trasactionPriceTxt.clearButtonMode = .Always
        trasactionPriceTxt.autocapitalizationType = .None//首字母类型,默认关闭
        trasactionPriceTxt.keyboardType = .NamePhonePad//设置键盘类型为数字类
        trasactionPriceTxt.userInteractionEnabled = true
        self.view.addSubview(trasactionPriceTxt)
        
        descr = UILabel(frame: CGRectMake(10, trasactionPrice.frame.maxY + 10, 40, 20))
        descr.text = "备注:"
        descr.sizeToFit()
        descr.font = UIFont(name: "Courier-Bold", size: 14)
        self.view.addSubview(descr)
        descrTxt = UITextView(frame: CGRectMake(descr.frame.maxX + 10, descr.frame.minY, mainSize.width - descr.frame.maxX - 20, 50))
        descrTxt.layer.cornerRadius = 5
        //        descrTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        descrTxt.layer.borderWidth = 0.5
        descrTxt.layer.borderColor = UIColor.redColor().CGColor
        descrTxt.autocapitalizationType = .None//首字母类型,默认关闭
        descrTxt.text = descr1
        descrTxt.font = UIFont(name: "Courier-Bold", size: 14)
        descrTxt.selectable = false
        descrTxt.editable = true
        self.view.addSubview(descrTxt)
    }
    
        func AddmeasuerHouse() {
            print("添加量房人员")
            let alertController = UIAlertController(title: "选择店员", message: nil,
                                                    preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            let bm1 = UIAlertAction(title: "王慧", style: .Default) { (_) in
                self.measuerHouse2.text = "王慧"
            }
            let bm2 = UIAlertAction(title: "刘山", style: .Default) { (_) in
                self.measuerHouse2.text = "刘山"
            }
            let bm3 = UIAlertAction(title: "毛亮", style: .Default) { (_) in
                self.measuerHouse2.text = "毛亮"
            }
            let bm4 = UIAlertAction(title: "杨晶", style: .Default) { (_) in
                self.measuerHouse2.text = "杨晶"
            }
            let bm5 = UIAlertAction(title: "王强", style: .Default) { (_) in
                self.measuerHouse2.text = "王强"
            }
            let bm6 = UIAlertAction(title: "万杰", style: .Default) { (_) in
                self.measuerHouse2.text = "万杰"
            }
            let bm7 = UIAlertAction(title: "朱志龙", style: .Default) { (_) in
                self.measuerHouse2.text = "朱志龙"
            }
            let bm8 = UIAlertAction(title: "李永玲", style: .Default) { (_) in
                self.measuerHouse2.text = "李永玲"
            }
            let bm9 = UIAlertAction(title: "易丽萍", style: .Default) { (_) in
                self.measuerHouse2.text = "易丽萍"
            }
            alertController.addAction(cancelAction)
            alertController.addAction(bm1)
            alertController.addAction(bm2)
            alertController.addAction(bm3)
            alertController.addAction(bm4)
            alertController.addAction(bm5)
            alertController.addAction(bm6)
            alertController.addAction(bm7)
            alertController.addAction(bm8)
            alertController.addAction(bm9)
            self.presentViewController(alertController, animated: true, completion: nil)
    
        }
    
        func Adddesigner() {
            print("添加设计师")
            let alertController = UIAlertController(title: "选择店员", message: nil,
                                                    preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            let bm1 = UIAlertAction(title: "王慧", style: .Default) { (_) in
                self.designer2.text = "王慧"
            }
            let bm2 = UIAlertAction(title: "杨晶", style: .Default) { (_) in
                self.designer2.text = "杨晶"
            }
            let bm3 = UIAlertAction(title: "王强", style: .Default) { (_) in
                self.designer2.text = "王强"
            }
            alertController.addAction(cancelAction)
            alertController.addAction(bm1)
            alertController.addAction(bm2)
            alertController.addAction(bm3)
            self.presentViewController(alertController, animated: true, completion: nil)
    
        }
    
        func AddprojectDesigin() {
            print("是否完成效果图")
            let alertController = UIAlertController(title: "选择", message: nil,
                                                    preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            let OK = UIAlertAction(title: "已完成", style: .Default) { (_) in
                self.projectDesigin2.text = "已完成"
            }
            alertController.addAction(cancelAction)
            alertController.addAction(OK)
            self.presentViewController(alertController, animated: true, completion: nil)
    
        }
    
    
    
        func update() {
            print("update")
            let query = AVQuery(className: "KeHuData")
            query.whereKey("name", equalTo:  self.name2.text)
            query.whereKey("phone", equalTo: self.phone2.text)
            query.findObjectsInBackgroundWithBlock({ (objects, error:NSError!) in
                if error == nil {
                    for object in objects {
                        // object就是从数据库中获取的单条记录
                        object.setObject(self.designer2.text, forKey: "designer")
                        object.setObject(self.measuerHouse2.text, forKey: "measuerHouse")
                        object.setObject(self.projectDesigin2.text, forKey: "projectDesigin")
                        object.setObject(self.trasactionPriceTxt.text, forKey: "trasactionPrice")
                        object.saveInBackgroundWithBlock({ (_, e) in
                            if e != nil{
                                let alertController = UIAlertController(title: "提示", message: "请检查网络或别的故障",preferredStyle: .Alert)
                                                        let OK = UIAlertAction(title: "确定", style: .Default, handler: nil)
                                                        alertController.addAction(OK)
                                                        self.presentViewController(alertController, animated: true, completion: nil)
                            }else{
                                self.presentViewController(TBViewController(), animated: true, completion: nil)

                            }
                        })
                    }
                }else {
                    print(error.localizedDescription)
                }
            })
    
//            let record = AVObject(className: "KeHuData")
//            record["name"] = self.name2.text//客户名
//            record["address"] = self.address2.text//客户地址
//            record["phone"] = self.phone2.text//客户手机
//            record["style"] = self.style2.text//喜爱风格
//            record["color"] = self.color2.text//喜爱颜色
//            record["descr"] = self.descrTxt.text//客户要求备注
//            record["BusinessManager"] = self.BusinessManager2.text//客户经理
//            record["measuerHouse"] = self.measuerHouse2.text//量房人员
//            record["designer"] = self.designer2.text//设计师
//            record["projectDesigin"] = self.projectDesigin2.text//是否设计完成
//            record["budget"] = self.budget2.text//预算价格
//            record["trasactionPrice"] = self.trasactionPriceTxt.text//成交价格
//            let query = AVQuery(className: "KeHuData")
//            query.whereKey("name", equalTo: self.name2.text)
//            query.whereKey("phone", equalTo: self.phone2.text)
//            query.getObjectInBackgroundWithId(objectID) { (_, e) in
//                record.saveInBackground()
//                record.saveInBackgroundWithBlock { (_, e) in
//                        print("update")
////                        record.saveInBackground()
//                     if e != nil {
//                        let alertController = UIAlertController(title: "提示", message: "请检查网络或别的故障",
//                            preferredStyle: .Alert)
//                        let OK = UIAlertAction(title: "确定", style: .Default) { (_) in
//                        }
//                        alertController.addAction(OK)
//                        self.presentViewController(alertController, animated: true, completion: nil)
//                     }else{
//                        self.presentViewController(TBViewController(), animated: true, completion: nil)
//                }
//            }
//        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{//设置键盘点击之后隐藏
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {//隐藏键盘的另一种方法
        //        nameTxt.resignFirstResponder()
        //        addressTxt.resignFirstResponder()
        //        phoneTxt.resignFirstResponder()
        trasactionPriceTxt.resignFirstResponder()
        descrTxt.resignFirstResponder()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
