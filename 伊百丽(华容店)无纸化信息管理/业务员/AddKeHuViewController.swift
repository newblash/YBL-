//
//  AddKeHuViewController.swift
//  伊百丽(华容店)无纸化信息管理
//
//  Created by 杨晶 on 16/4/25.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class AddKeHuViewController: UIViewController, UITextFieldDelegate{

    var name = UILabel()//客户姓名
    var address = UILabel()//客户地址
    var phone = UILabel()//客户手机
    var style = UILabel()//风格-选项
    var color = UILabel()//颜色-选项
    var descr = UILabel()//备注框
    var addTime = UILabel()//添加日期-自动获取
    var BusinessManager = UILabel()//客户经理-选项
    var measuerHouse = UILabel()//量房-选项
    var designer = UILabel()//设计师-选项
    var projectDesigin = UILabel()//项目是否完成-选项
    var trasactionPrice = UILabel()//成交价格
    var budget = UILabel()//预算价格
    var info = UILabel()//最后的警告信息
    
    var nameTxt = UITextField()//姓名
    var addressTxt = UITextField()//地址
    var phoneTxt = UITextField()//手机
    var styleTxt = UITextField()//风格
    var colorTxt = UITextField()//颜色
    var descrTxt = UITextView()//备注
    var addTimeTxt = UITextField()//日期
    var BusinessManagerTxt = UITextField()//客户经理
    var measuerHouseTxt = UITextField()//量房
    var designerTxt = UITextField()//设计师
    var projectDesiginTxt = UITextField()//方案
    var budgetTxt = UITextField()//预算价格
    var trasactionPriceTxt = UITextField()//成交价格

    
    var add = UIButton(type: UIButtonType.Custom)//添加客户按钮
    var styleType = UIButton(type: UIButtonType.Custom)//添加风格
    var colorType = UIButton(type: UIButtonType.Custom)//添加颜色
    var BusinessManagerType = UIButton(type: UIButtonType.Custom)//添加客户经理
    var measuerHouseType = UIButton(type: UIButtonType.Custom)//添加量房人员
    var designerType = UIButton(type: UIButtonType.Custom)//添加设计师
    var projectDesiginType = UIButton(type: UIButtonType.Custom)//添加是否设计完成

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        let mainSize = UIScreen.mainScreen().bounds.size
        navigationItem.title = ""
        
        name = UILabel(frame: CGRectMake(10, 70, 80, 25))
        name.text = "客户:"
        self.view.addSubview(name)
        
        nameTxt = UITextField(frame: CGRectMake(name.frame.maxX + 10, name.frame.minY, mainSize.width - name.frame.maxX - 20, 20))
        nameTxt.placeholder = "输入客户名"
        nameTxt.layer.cornerRadius = 5
        nameTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        nameTxt.borderStyle = UITextBorderStyle.RoundedRect
        nameTxt.clearButtonMode = .Always
        nameTxt.autocapitalizationType = .None//首字母类型,默认关闭
        self.view.addSubview(nameTxt)
        
        address = UILabel(frame: CGRectMake(10, name.frame.maxY + 5, 80, 25))
        address.text = "地址:"
        self.view.addSubview(address)
        
        addressTxt = UITextField(frame: CGRectMake(address.frame.maxX + 10, address.frame.minY, mainSize.width - address.frame.maxX - 20, 20))
        addressTxt.placeholder = "输入地址"
        addressTxt.layer.cornerRadius = 5
        addressTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        addressTxt.borderStyle = UITextBorderStyle.RoundedRect
        addressTxt.clearButtonMode = .Always
        addressTxt.autocapitalizationType = .None//首字母类型,默认关闭
        self.view.addSubview(addressTxt)
        
        phone = UILabel(frame: CGRectMake(10, address.frame.maxY + 5, 80, 25))
        phone.text = "电话:"
        self.view.addSubview(phone)
        phoneTxt = UITextField(frame: CGRectMake(phone.frame.maxX + 10, phone.frame.minY, mainSize.width - phone.frame.maxX - 20, 20))
        phoneTxt.placeholder = "输入电话"
        phoneTxt.layer.cornerRadius = 5
        phoneTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        phoneTxt.borderStyle = UITextBorderStyle.RoundedRect
        phoneTxt.clearButtonMode = .Always
        phoneTxt.autocapitalizationType = .None//首字母类型,默认关闭
        phoneTxt.delegate = self
        phoneTxt.keyboardType = .NamePhonePad//设置键盘类型为数字类
        self.view.addSubview(phoneTxt)
        
        style = UILabel(frame: CGRectMake(10, phone.frame.maxY + 5, 80, 25))
        style.text = "风格:"
        self.view.addSubview(style)
        styleTxt = UITextField(frame: CGRectMake(style.frame.maxX + 10, style.frame.minY, mainSize.width - style.frame.maxX - 110, 20))
        styleTxt.placeholder = "选择风格"
        styleTxt.layer.cornerRadius = 5
        styleTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        styleTxt.borderStyle = UITextBorderStyle.RoundedRect
//        styleTxt.clearButtonMode = .Always
        styleTxt.autocapitalizationType = .None//首字母类型,默认关闭
        styleTxt.userInteractionEnabled = false
        self.view.addSubview(styleTxt)
        styleType = UIButton(frame: CGRectMake(styleTxt.frame.maxX + 10, styleTxt.frame.minY, 80, 25))
        styleType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        styleType.setTitle("选择风格", forState: UIControlState.Normal)
        styleType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        styleType.layer.cornerRadius = 5//设置圆角
        styleType.backgroundColor = UIColor.blueColor()//背景颜色
        styleType.addTarget(self, action: #selector(AddKeHuViewController.AddStyle), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(styleType)
        
        color = UILabel(frame: CGRectMake(10, style.frame.maxY + 5, 80, 25))
        color.text = "颜色:"
        self.view.addSubview(color)
        colorTxt = UITextField(frame: CGRectMake(color.frame.maxX + 10, color.frame.minY, mainSize.width - color.frame.maxX - 110, 25))
        colorTxt.placeholder = "选择颜色"
        colorTxt.layer.cornerRadius = 5
        colorTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        colorTxt.borderStyle = UITextBorderStyle.RoundedRect
//        colorTxt.clearButtonMode = .Always
        colorTxt.autocapitalizationType = .None//首字母类型,默认关闭
        colorTxt.userInteractionEnabled = false
        self.view.addSubview(colorTxt)
        
        colorType = UIButton(frame: CGRectMake(colorTxt.frame.maxX + 10, colorTxt.frame.minY, 80, 25))
        colorType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        colorType.setTitle("选择颜色", forState: UIControlState.Normal)
        colorType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        colorType.layer.cornerRadius = 5//设置圆角
        colorType.backgroundColor = UIColor.blueColor()//背景颜色
        colorType.addTarget(self, action: #selector(AddKeHuViewController.AddColor), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(colorType)
        
        addTime = UILabel(frame: CGRectMake(10, color.frame.maxY + 5, 80, 25))
        addTime.text = "日期:"
        self.view.addSubview(addTime)
        addTimeTxt = UITextField(frame: CGRectMake(addTime.frame.maxX + 10, addTime.frame.minY, mainSize.width - addTime.frame.maxX - 20, 25))
        addTimeTxt.placeholder = "日期为自动保存"
        addTimeTxt.layer.cornerRadius = 5
        addTimeTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        addTimeTxt.borderStyle = UITextBorderStyle.RoundedRect
        addTimeTxt.clearButtonMode = .Always
        addTimeTxt.autocapitalizationType = .None//首字母类型,默认关闭
        addTimeTxt.userInteractionEnabled = false
        self.view.addSubview(addTimeTxt)
        
        BusinessManager = UILabel(frame: CGRectMake(10, addTime.frame.maxY + 5, 80, 25))
        BusinessManager.text = "客户经理:"
        self.view.addSubview(BusinessManager)
        BusinessManagerTxt = UITextField(frame: CGRectMake(BusinessManager.frame.maxX + 10, BusinessManager.frame.minY, mainSize.width - BusinessManager.frame.maxX - 110, 25))
        BusinessManagerTxt.placeholder = "选择客户经理"
        BusinessManagerTxt.layer.cornerRadius = 5
        BusinessManagerTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        BusinessManagerTxt.borderStyle = UITextBorderStyle.RoundedRect
//        BusinessManagerTxt.clearButtonMode = .Always
        BusinessManagerTxt.autocapitalizationType = .None//首字母类型,默认关闭
        BusinessManagerTxt.userInteractionEnabled = false
        self.view.addSubview(BusinessManagerTxt)
        
        BusinessManagerType = UIButton(frame: CGRectMake(BusinessManagerTxt.frame.maxX + 10, BusinessManagerTxt.frame.minY, 80, 25))
        BusinessManagerType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        BusinessManagerType.setTitle("客户经理", forState: UIControlState.Normal)
        BusinessManagerType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        BusinessManagerType.layer.cornerRadius = 5//设置圆角
        BusinessManagerType.backgroundColor = UIColor.blueColor()//背景颜色
        BusinessManagerType.addTarget(self, action: #selector(AddKeHuViewController.AddBusinessManager), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(BusinessManagerType)
        
        measuerHouse = UILabel(frame: CGRectMake(10, BusinessManager.frame.maxY + 5, 80, 25))
        measuerHouse.text = "量房:"
        self.view.addSubview(measuerHouse)
        measuerHouseTxt = UITextField(frame: CGRectMake(measuerHouse.frame.maxX + 10, measuerHouse.frame.minY, mainSize.width - measuerHouse.frame.maxX - 110, 25))
        measuerHouseTxt.placeholder = "选择量房人员"
        measuerHouseTxt.layer.cornerRadius = 5
        measuerHouseTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        measuerHouseTxt.borderStyle = UITextBorderStyle.RoundedRect
//        measuerHouseTxt.clearButtonMode = .Always
        measuerHouseTxt.autocapitalizationType = .None//首字母类型,默认关闭
        measuerHouseTxt.userInteractionEnabled = false
        self.view.addSubview(measuerHouseTxt)
        
        measuerHouseType = UIButton(frame: CGRectMake(measuerHouseTxt.frame.maxX + 10, measuerHouseTxt.frame.minY, 80, 25))
        measuerHouseType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        measuerHouseType.setTitle("量房人员", forState: UIControlState.Normal)
        measuerHouseType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        measuerHouseType.layer.cornerRadius = 5//设置圆角
        measuerHouseType.backgroundColor = UIColor.darkGrayColor()//背景颜色
        measuerHouseType.userInteractionEnabled = false//让按钮不可用
        measuerHouseType.addTarget(self, action: #selector(AddKeHuViewController.AddmeasuerHouse), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(measuerHouseType)
        
        designer = UILabel(frame: CGRectMake(10, measuerHouse.frame.maxY + 5, 80, 25))
        designer.text = "设计师:"
        self.view.addSubview(designer)
        designerTxt = UITextField(frame: CGRectMake(designer.frame.maxX + 10, designer.frame.minY, mainSize.width - designer.frame.maxX - 110, 25))
        designerTxt.placeholder = "选择设计师"
        designerTxt.layer.cornerRadius = 5
        designerTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        designerTxt.borderStyle = UITextBorderStyle.RoundedRect
//        designerTxt.clearButtonMode = .Always
        designerTxt.autocapitalizationType = .None//首字母类型,默认关闭
        designerTxt.userInteractionEnabled = false//让按钮不可用
        self.view.addSubview(designerTxt)
        designerType = UIButton(frame: CGRectMake(designerTxt.frame.maxX + 10, designerTxt.frame.minY, 80, 25))
        designerType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        designerType.setTitle("设计师", forState: UIControlState.Normal)
        designerType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        designerType.layer.cornerRadius = 5//设置圆角
        designerType.backgroundColor = UIColor.darkGrayColor()//背景颜色灰色
        designerType.userInteractionEnabled = false//让按钮不可用
        designerType.addTarget(self, action: #selector(AddKeHuViewController.Adddesigner), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(designerType)
        
        projectDesigin = UILabel(frame: CGRectMake(10, designer.frame.maxY + 5, 80, 25))
        projectDesigin.text = "方案:"
        self.view.addSubview(projectDesigin)
        projectDesiginTxt = UITextField(frame: CGRectMake(projectDesigin.frame.maxX + 10, projectDesigin.frame.minY, mainSize.width - projectDesigin.frame.maxX - 110, 25))
        projectDesiginTxt.placeholder = "默认未完成"
        projectDesiginTxt.layer.cornerRadius = 5
        projectDesiginTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        projectDesiginTxt.borderStyle = UITextBorderStyle.RoundedRect
//        projectDesiginTxt.clearButtonMode = .Always
        projectDesiginTxt.autocapitalizationType = .None//首字母类型,默认关闭
        projectDesiginTxt.userInteractionEnabled = false
        self.view.addSubview(projectDesiginTxt)
        projectDesiginType = UIButton(frame: CGRectMake(projectDesiginTxt.frame.maxX + 10, projectDesiginTxt.frame.minY, 80, 25))
        projectDesiginType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        projectDesiginType.setTitle("提交方案", forState: UIControlState.Normal)
        projectDesiginType.titleLabel?.font = UIFont.systemFontOfSize(projectDesiginType.frame.height/1.5)
        projectDesiginType.layer.cornerRadius = 5//设置圆角
        projectDesiginType.backgroundColor = UIColor.darkGrayColor()//背景颜色
        projectDesiginType.userInteractionEnabled = false//让按钮不可用
        projectDesiginType.addTarget(self, action: #selector(AddKeHuViewController.AddprojectDesigin), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(projectDesiginType)
        
        budget = UILabel(frame: CGRectMake(10, projectDesigin.frame.maxY + 5, 80, 25))
        budget.text = "预算价格:"
        self.view.addSubview(budget)
        budgetTxt = UITextField(frame: CGRectMake(budget.frame.maxX + 10, budget.frame.minY, mainSize.width - budget.frame.maxX - 20, 25))
        budgetTxt.placeholder = "客户经理输入预算价格"
        budgetTxt.layer.cornerRadius = 5
        budgetTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        budgetTxt.borderStyle = UITextBorderStyle.RoundedRect
        budgetTxt.clearButtonMode = .Always
        budgetTxt.autocapitalizationType = .None//首字母类型,默认关闭
        budgetTxt.keyboardType = .NamePhonePad//设置键盘类型为数字类
        budgetTxt.userInteractionEnabled = true
        self.view.addSubview(budgetTxt)
        
        trasactionPrice = UILabel(frame: CGRectMake(10, budget.frame.maxY + 5, 80, 25))
        trasactionPrice.text = "成交价格:"
        self.view.addSubview(trasactionPrice)
        trasactionPriceTxt = UITextField(frame: CGRectMake(trasactionPrice.frame.maxX + 10, trasactionPrice.frame.minY, mainSize.width - trasactionPrice.frame.maxX - 20, 25))
        trasactionPriceTxt.placeholder = "设计师或店长输入成交价格"
        trasactionPriceTxt.layer.cornerRadius = 5
        trasactionPriceTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        trasactionPriceTxt.borderStyle = UITextBorderStyle.RoundedRect
        trasactionPriceTxt.clearButtonMode = .Always
        trasactionPriceTxt.autocapitalizationType = .None//首字母类型,默认关闭
        trasactionPriceTxt.keyboardType = .NamePhonePad//设置键盘类型为数字类
        trasactionPriceTxt.userInteractionEnabled = false
        self.view.addSubview(trasactionPriceTxt)
        
        descr = UILabel(frame: CGRectMake(10, trasactionPrice.frame.maxY + 5, 40, 25))
        descr.text = "备注:"
        self.view.addSubview(descr)
        descrTxt = UITextView(frame: CGRectMake(descr.frame.maxX + 10, descr.frame.minY, mainSize.width - descr.frame.maxX - 20, 50))
        descrTxt.layer.cornerRadius = 5
//        descrTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        descrTxt.layer.borderWidth = 0.5
        descrTxt.layer.borderColor = UIColor.redColor().CGColor
        descrTxt.autocapitalizationType = .None//首字母类型,默认关闭
        descrTxt.selectable = false
        descrTxt.editable = true
        self.view.addSubview(descrTxt)
        
        info = UILabel(frame: CGRectMake(10, descrTxt.frame.maxY + 10, mainSize.width - 20, 20))
        info.text = "⚠️确定后不能更改,请仔细对比数据"
        info.textColor = UIColor.redColor()
        self.view.addSubview(info)
        
        
        add = UIButton(frame: CGRectMake(100, info.frame.maxY + 10, mainSize.width - 200, 40))
        add.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        add.setTitle("确定", forState: UIControlState.Normal)
        add.titleLabel?.font = UIFont.systemFontOfSize(add.frame.height/1.5)
        add.layer.cornerRadius = 5//设置圆角
        add.backgroundColor = UIColor.darkGrayColor()//背景颜色
        add.addTarget(self, action: #selector(AddKeHuViewController.Add), forControlEvents: .TouchUpInside)//按钮事件
        self.view.addSubview(add)
        
        // Do any additional setup after loading the view.
    }
    
    func Add() {
        print("添加客户")
//        if nameTxt.text == "" && pwsTxt.text == "" && pws1.text == ""{
//            let alert = UIAlertController(title: "⚠️", message: "账号密码不能为空", preferredStyle: .Alert)
//            //            let cancle = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
//            let ok = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            //            alert.addAction(cancle)
//            alert.addAction(ok)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }else if pws.text != pws1.text{
//            let alert = UIAlertController(title: "两次输入的密码不相同", message: "请重新输入", preferredStyle: .Alert)
//            let ok = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            alert.addAction(ok)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }else {
            saveRecordToCloud()
//            let alert = UIAlertController(title: "提示", message: "保存成功", preferredStyle: .Alert)
//            let ok = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            alert.addAction(ok)
//            self.presentViewController(alert, animated: true, completion: nil)
//            presentViewController(TB1ViewController(), animated: true, completion: nil)//转场
//        }
    }
    func AddStyle() {
        print("添加风格")
        let alertController = UIAlertController(title: "选择风格", message: "请严格按客户喜好选择",
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let style1 = UIAlertAction(title: "现代风格", style: .Default) { (_) in
            self.styleTxt.text = "现代风格"
        }
        let style2 = UIAlertAction(title: "中式风格", style: .Default) { (_) in
            self.styleTxt.text = "中式风格"
        }
        let style3 = UIAlertAction(title: "欧式风格", style: .Default) { (_) in
            self.styleTxt.text = "欧式风格"
        }
        let style4 = UIAlertAction(title: "地中海风格", style: .Default) { (_) in
            self.styleTxt.text = "地中海风格"
        }
        let style5 = UIAlertAction(title: "美式风格", style: .Default) { (_) in
            self.styleTxt.text = "美式风格"
        }
        let style6 = UIAlertAction(title: "无要求", style: .Default) { (_) in
            self.styleTxt.text = "无要求"
        }
        alertController.addAction(cancelAction)
        alertController.addAction(style1)
        alertController.addAction(style2)
        alertController.addAction(style3)
        alertController.addAction(style4)
        alertController.addAction(style5)
        alertController.addAction(style6)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func AddColor() {
        print("添加颜色")
        let alertController = UIAlertController(title: "选择颜色", message: nil,
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let color1 = UIAlertAction(title: "香脂桐", style: .Default) { (_) in
            self.colorTxt.text = "香脂桐"
        }
        let color2 = UIAlertAction(title: "北美枫", style: .Default) { (_) in
            self.colorTxt.text = "北美枫"
        }
        let color3 = UIAlertAction(title: "优雅白", style: .Default) { (_) in
            self.colorTxt.text = "优雅白"
        }
        let color4 = UIAlertAction(title: "中国红", style: .Default) { (_) in
            self.colorTxt.text = "中国红"
        }
        let color5 = UIAlertAction(title: "橡果白", style: .Default) { (_) in
            self.colorTxt.text = "橡果白"
        }
        let color6 = UIAlertAction(title: "浅胡桃", style: .Default) { (_) in
            self.colorTxt.text = "浅胡桃"
        }
        let color7 = UIAlertAction(title: "玉樱桃", style: .Default) { (_) in
            self.colorTxt.text = "玉樱桃"
        }
        let color8 = UIAlertAction(title: "金丝黄", style: .Default) { (_) in
            self.colorTxt.text = "金丝黄"
        }
        let color9 = UIAlertAction(title: "黑金檀", style: .Default) { (_) in
            self.colorTxt.text = "黑金檀"
        }
        let color10 = UIAlertAction(title: "红花梨", style: .Default) { (_) in
            self.colorTxt.text = "红花梨"
        }
        let color11 = UIAlertAction(title: "金柚木", style: .Default) { (_) in
            self.colorTxt.text = "金柚木"
        }
        let color12 = UIAlertAction(title: "黄橡木", style: .Default) { (_) in
            self.colorTxt.text = "黄橡木"
        }
        let color13 = UIAlertAction(title: "金丝楠", style: .Default) { (_) in
            self.colorTxt.text = "金丝楠"
        }
        let color14 = UIAlertAction(title: "颜色未选", style: .Default) { (_) in
            self.colorTxt.text = "颜色未选"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(color1)
        alertController.addAction(color2)
        alertController.addAction(color3)
        alertController.addAction(color4)
        alertController.addAction(color5)
        alertController.addAction(color6)
        alertController.addAction(color7)
        alertController.addAction(color8)
        alertController.addAction(color9)
        alertController.addAction(color10)
        alertController.addAction(color11)
        alertController.addAction(color12)
        alertController.addAction(color13)
        alertController.addAction(color14)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func AddBusinessManager() {
        print("添加客户经理")
        let alertController = UIAlertController(title: "选择店员", message: nil,
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let bm1 = UIAlertAction(title: "王慧", style: .Default) { (_) in
            self.BusinessManagerTxt.text = "王慧"
        }
        let bm2 = UIAlertAction(title: "刘山", style: .Default) { (_) in
            self.BusinessManagerTxt.text = "刘山"
        }
        let bm3 = UIAlertAction(title: "毛亮", style: .Default) { (_) in
            self.BusinessManagerTxt.text = "毛亮"
        }
        let bm4 = UIAlertAction(title: "易丽萍", style: .Default) { (_) in
            self.BusinessManagerTxt.text = "易丽萍"
        }
        let bm5 = UIAlertAction(title: "李咏玲", style: .Default) { (_) in
            self.BusinessManagerTxt.text = "李咏玲"
        }
        alertController.addAction(cancelAction)
        alertController.addAction(bm1)
        alertController.addAction(bm2)
        alertController.addAction(bm3)
        alertController.addAction(bm4)
        alertController.addAction(bm5)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func AddmeasuerHouse() {
        print("添加量房人员")
        let alertController = UIAlertController(title: "选择店员", message: nil,
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let bm1 = UIAlertAction(title: "王慧", style: .Default) { (_) in
            self.measuerHouseTxt.text = "王慧"
        }
        let bm2 = UIAlertAction(title: "刘山", style: .Default) { (_) in
            self.measuerHouseTxt.text = "刘山"
        }
        let bm3 = UIAlertAction(title: "毛亮", style: .Default) { (_) in
            self.measuerHouseTxt.text = "毛亮"
        }
        let bm4 = UIAlertAction(title: "杨晶", style: .Default) { (_) in
            self.measuerHouseTxt.text = "杨晶"
        }
        let bm5 = UIAlertAction(title: "王强", style: .Default) { (_) in
            self.measuerHouseTxt.text = "王强"
        }
        let bm6 = UIAlertAction(title: "万杰", style: .Default) { (_) in
            self.measuerHouseTxt.text = "万杰"
        }
        let bm7 = UIAlertAction(title: "朱志龙", style: .Default) { (_) in
            self.measuerHouseTxt.text = "朱志龙"
        }
        let bm8 = UIAlertAction(title: "李永玲", style: .Default) { (_) in
            self.measuerHouseTxt.text = "李永玲"
        }
        let bm9 = UIAlertAction(title: "易丽萍", style: .Default) { (_) in
            self.measuerHouseTxt.text = "易丽萍"
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
            self.designerTxt.text = "王慧"
        }
        let bm2 = UIAlertAction(title: "杨晶", style: .Default) { (_) in
            self.designerTxt.text = "杨晶"
        }
        let bm3 = UIAlertAction(title: "王强", style: .Default) { (_) in
            self.designerTxt.text = "王强"
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
            self.projectDesiginTxt.text = "已完成"
        }
        alertController.addAction(cancelAction)
        alertController.addAction(OK)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }


    
    func saveRecordToCloud() {
        
        let record = AVObject(className: "KeHuData")
        record["name"] = self.nameTxt.text//客户名
        record["address"] = self.addressTxt.text//客户地址
        record["phone"] = self.phoneTxt.text//客户手机
        record["style"] = self.styleTxt.text//喜爱风格
        record["color"] = self.colorTxt.text//喜爱颜色
        record["descr"] = self.descrTxt.text//客户要求备注
        record["BusinessManager"] = self.BusinessManagerTxt.text//客户经理
        record["measuerHouse"] = self.measuerHouseTxt.text//量房人员
        record["designer"] = self.designerTxt.text//设计师
        record["projectDesigin"] = self.projectDesiginTxt.text//是否设计完成
        record["budget"] = self.budgetTxt.text//预算价格
        record["trasactionPrice"] = self.trasactionPriceTxt.text//成交价格
        
        let query = AVQuery(className: "KeHuData")
        query.whereKey("phone", equalTo: self.phoneTxt.text)
        query.getFirstObjectInBackgroundWithBlock { (phone, e) in
            
            if self.nameTxt.text == "" && self.phoneTxt.text == ""{
                let alertController = UIAlertController(title: "提示", message: "客户姓名和手机为必填",
                    preferredStyle: .Alert)
                let OK = UIAlertAction(title: "确定", style: .Default) { (_) in
                }
                alertController.addAction(OK)
                self.presentViewController(alertController, animated: true, completion: nil)
            }else if phone != nil{
                let alertController = UIAlertController(title: "提示", message: "此手机号码已报备",
                    preferredStyle: .Alert)
                let OK = UIAlertAction(title: "确定", style: .Default) { (_) in
                }
                alertController.addAction(OK)
                self.presentViewController(alertController, animated: true, completion: nil)
            }else{
                record.saveInBackgroundWithBlock { (_, e) in
                    if let e = e {
                        print(e.localizedDescription)
                        let alertController = UIAlertController(title: "提示", message: "请检查网络或别的故障",
                            preferredStyle: .Alert)
                        let OK = UIAlertAction(title: "确定", style: .Default) { (_) in
                        }
                        alertController.addAction(OK)
                        self.presentViewController(alertController, animated: true, completion: nil)
                    } else {
                        print("保存成功！")
                        self.presentViewController(TB2ViewController(), animated: true, completion: nil)
                    }
                }
            }
        }


        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{//设置键盘点击之后隐藏
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {//隐藏键盘的另一种方法
        nameTxt.resignFirstResponder()
        addressTxt.resignFirstResponder()
        phoneTxt.resignFirstResponder()
        budgetTxt.resignFirstResponder()
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
