//
//  AddKehuTableViewController.swift
//  YBL数据管理
//
//  Created by 杨晶 on 16/5/19.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class AddKehuTableViewController: UITableViewController, UITextFieldDelegate {

    var alert = SweetAlert()
    
    
    var lableInfo = ["姓名:","地址:","手机:","风格:","颜色:","报备日期:","客户经理:","量房:","设计师:","是否完成:","成交价格:","备注:"]
    var 店员 = ["毛亮","刘山","王慧","杨晶","王强","晏哲","易丽萍","李咏玲","万杰","朱志龙","蔡水波"]
    var 风格 = ["现代","中式","欧式","地中海","美式","无要求"]
    var 颜色 = ["香脂桐","优雅白","橡果白","中国红","浅胡桃","玉樱桃","黑金檀","红花梨","金柚木","黄橡木","北美枫","金丝楠","苹果绿"]

    
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
    var trasactionPriceTxt = UITextField()//成交价格
    
    var styleType = UIButton(type: UIButtonType.Custom)//添加风格
    var colorType = UIButton(type: UIButtonType.Custom)//添加颜色
    var BusinessManagerType = UIButton(type: UIButtonType.Custom)//添加客户经理
    var measuerHouseType = UIButton(type: UIButtonType.Custom)//添加量房人员
    var designerType = UIButton(type: UIButtonType.Custom)//添加设计师
    var projectDesiginType = UIButton(type: UIButtonType.Custom)//添加是否设计完成
    
    
    var mainSize: CGSize!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        mainSize = UIScreen.mainScreen().bounds.size
        navigationItem.title = "添加客户"
        tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        
        let item = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddKehuTableViewController.saveRecordToCloud))
        navigationItem.setRightBarButtonItem(item, animated: true)
        
        nameTxt.delegate = self
        addressTxt.delegate = self
        phoneTxt.delegate = self

        //添加回收键盘的手势
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddKehuTableViewController.handleTap(_:))))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return descrTxt.frame.maxY + 10
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.Value2, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        
        name = UILabel(frame: CGRectMake(10, 5, 65, 25))
        name.text = lableInfo[indexPath.row]
        name.font = UIFont.systemFontOfSize(15)
        name.textColor = UIColor.greenColor()


//        nameTxt.textAlignment = .Right//右对齐
        
        nameTxt = UITextField(frame: CGRectMake(name.frame.maxX + 10, name.frame.minY, mainSize.width - name.frame.maxX - 20, 25))
        nameTxt.placeholder = "输入客户名"
        nameTxt.layer.cornerRadius = 5
        nameTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        nameTxt.borderStyle = UITextBorderStyle.RoundedRect
        nameTxt.clearButtonMode = .Always
        nameTxt.adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
        nameTxt.minimumFontSize=10  //最小可缩小的字号
        nameTxt.font = UIFont.systemFontOfSize(15)
        nameTxt.autocapitalizationType = .None//首字母类型,默认关闭
        nameTxt.resignFirstResponder()
        
        
        address = UILabel(frame: CGRectMake(10, name.frame.maxY + 5, name.frame.width, 25))
        address.text = lableInfo[indexPath.row + 1]
        address.font = UIFont.systemFontOfSize(15)
        address.textColor = UIColor.greenColor()
        
        addressTxt = UITextField(frame: CGRectMake(address.frame.maxX + 10, address.frame.minY, mainSize.width - address.frame.maxX - 20, 25))
        addressTxt.placeholder = "输入地址"
        addressTxt.layer.cornerRadius = 5
        addressTxt.adjustsFontSizeToFitWidth = true
        addressTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        addressTxt.borderStyle = UITextBorderStyle.RoundedRect
        addressTxt.clearButtonMode = .Always
        addressTxt.autocapitalizationType = .None//首字母类型,默认关闭
        
        
        phone = UILabel(frame: CGRectMake(10, address.frame.maxY + 5, name.frame.width, 25))
        phone.text = lableInfo[indexPath.row + 2]
        phone.font = UIFont.systemFontOfSize(15)
        phone.textColor = UIColor.greenColor()

        phoneTxt = UITextField(frame: CGRectMake(phone.frame.maxX + 10, phone.frame.minY, mainSize.width - phone.frame.maxX - 20, 25))
        phoneTxt.placeholder = "输入电话"
        phoneTxt.layer.cornerRadius = 5
        phoneTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        phoneTxt.borderStyle = UITextBorderStyle.RoundedRect
        phoneTxt.clearButtonMode = .Always
        phoneTxt.autocapitalizationType = .None//首字母类型,默认关闭
        phoneTxt.delegate = self
        phoneTxt.keyboardType = .NumberPad//设置键盘类型为数字类
        
        
        style = UILabel(frame: CGRectMake(10, phone.frame.maxY + 5, name.frame.width, 25))
        style.text = lableInfo[indexPath.row + 3]
        style.font = UIFont.systemFontOfSize(15)
        style.textColor = UIColor.greenColor()
        
        styleTxt = UITextField(frame: CGRectMake(style.frame.maxX + 10, style.frame.minY, mainSize.width - style.frame.maxX - 110, 25))
        styleTxt.placeholder = "选择风格"
        styleTxt.layer.cornerRadius = 5
        styleTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        styleTxt.borderStyle = UITextBorderStyle.RoundedRect
        //        styleTxt.clearButtonMode = .Always
        styleTxt.autocapitalizationType = .None//首字母类型,默认关闭
        styleTxt.userInteractionEnabled = false
        
        styleType = UIButton(frame: CGRectMake(styleTxt.frame.maxX + 10, styleTxt.frame.minY, 80, 25))
        styleType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        styleType.setTitle("选择风格", forState: UIControlState.Normal)
        styleType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        styleType.layer.cornerRadius = 5//设置圆角
        styleType.backgroundColor = UIColor.blueColor()//背景颜色
        styleType.addTarget(self, action: #selector(AddKeHuViewController.AddStyle), forControlEvents: .TouchUpInside)//按钮事件
        
        
        color = UILabel(frame: CGRectMake(10, style.frame.maxY + 5, name.frame.width, 25))
        color.text = lableInfo[indexPath.row + 4]
        color.font = UIFont.systemFontOfSize(15)
        color.textColor = UIColor.greenColor()

        colorTxt = UITextField(frame: CGRectMake(color.frame.maxX + 10, color.frame.minY, mainSize.width - color.frame.maxX - 110, 25))
        colorTxt.placeholder = "选择颜色"
        colorTxt.layer.cornerRadius = 5
        colorTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        colorTxt.borderStyle = UITextBorderStyle.RoundedRect
        //        colorTxt.clearButtonMode = .Always
        colorTxt.autocapitalizationType = .None//首字母类型,默认关闭
        colorTxt.userInteractionEnabled = false
        
        
        colorType = UIButton(frame: CGRectMake(colorTxt.frame.maxX + 10, colorTxt.frame.minY, 80, 25))
        colorType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        colorType.setTitle("选择颜色", forState: UIControlState.Normal)
        colorType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        colorType.layer.cornerRadius = 5//设置圆角
        colorType.backgroundColor = UIColor.blueColor()//背景颜色
        colorType.addTarget(self, action: #selector(AddKeHuViewController.AddColor), forControlEvents: .TouchUpInside)//按钮事件
        
        
        addTime = UILabel(frame: CGRectMake(10, color.frame.maxY + 5, name.frame.width, 25))
        addTime.text = lableInfo[indexPath.row + 5]
        addTime.font = UIFont.systemFontOfSize(15)
        addTime.textColor = UIColor.greenColor()
        
        addTimeTxt = UITextField(frame: CGRectMake(addTime.frame.maxX + 10, addTime.frame.minY, mainSize.width - addTime.frame.maxX - 20, 25))
        addTimeTxt.placeholder = "日期为自动保存"
        addTimeTxt.layer.cornerRadius = 5
        addTimeTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        addTimeTxt.borderStyle = UITextBorderStyle.RoundedRect
        addTimeTxt.clearButtonMode = .Always
        addTimeTxt.autocapitalizationType = .None//首字母类型,默认关闭
        addTimeTxt.userInteractionEnabled = false
        
        
        BusinessManager = UILabel(frame: CGRectMake(10, addTime.frame.maxY + 5, name.frame.width, 25))
        BusinessManager.text = lableInfo[indexPath.row + 6]
        BusinessManager.font = UIFont.systemFontOfSize(15)
        BusinessManager.textColor = UIColor.greenColor()
        
        
        BusinessManagerTxt = UITextField(frame: CGRectMake(BusinessManager.frame.maxX + 10, BusinessManager.frame.minY, mainSize.width - BusinessManager.frame.maxX - 110, 25))
        BusinessManagerTxt.placeholder = "选择客户经理"
        BusinessManagerTxt.layer.cornerRadius = 5
        BusinessManagerTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        BusinessManagerTxt.borderStyle = UITextBorderStyle.RoundedRect
        //        BusinessManagerTxt.clearButtonMode = .Always
        BusinessManagerTxt.autocapitalizationType = .None//首字母类型,默认关闭
        BusinessManagerTxt.userInteractionEnabled = false
        
        
        BusinessManagerType = UIButton(frame: CGRectMake(BusinessManagerTxt.frame.maxX + 10, BusinessManagerTxt.frame.minY, 80, 25))
        BusinessManagerType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        BusinessManagerType.setTitle("客户经理", forState: UIControlState.Normal)
        BusinessManagerType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        BusinessManagerType.layer.cornerRadius = 5//设置圆角
        BusinessManagerType.backgroundColor = UIColor.blueColor()//背景颜色
        BusinessManagerType.addTarget(self, action: #selector(AddKeHuViewController.AddBusinessManager), forControlEvents: .TouchUpInside)//按钮事件
        
        
        measuerHouse = UILabel(frame: CGRectMake(10, BusinessManager.frame.maxY + 5, name.frame.width, 25))
        measuerHouse.text = lableInfo[indexPath.row + 7]
        measuerHouse.font = UIFont.systemFontOfSize(15)
        measuerHouse.textColor = UIColor.greenColor()
        
        
        measuerHouseTxt = UITextField(frame: CGRectMake(measuerHouse.frame.maxX + 10, measuerHouse.frame.minY, mainSize.width - measuerHouse.frame.maxX - 110, 25))
        measuerHouseTxt.placeholder = "当前页面不可选择"
        
        measuerHouseTxt.adjustsFontSizeToFitWidth = true
        measuerHouseTxt.layer.cornerRadius = 5
        measuerHouseTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        measuerHouseTxt.borderStyle = UITextBorderStyle.RoundedRect
        //        measuerHouseTxt.clearButtonMode = .Always
        measuerHouseTxt.autocapitalizationType = .None//首字母类型,默认关闭
        measuerHouseTxt.userInteractionEnabled = false
        
        
        measuerHouseType = UIButton(frame: CGRectMake(measuerHouseTxt.frame.maxX + 10, measuerHouseTxt.frame.minY, 80, 25))
        measuerHouseType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        measuerHouseType.setTitle("量房人员", forState: UIControlState.Normal)
        measuerHouseType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        measuerHouseType.layer.cornerRadius = 5//设置圆角
        measuerHouseType.backgroundColor = UIColor.darkGrayColor()//背景颜色
        measuerHouseType.userInteractionEnabled = false//让按钮不可用
        measuerHouseType.addTarget(self, action: #selector(AddKeHuViewController.AddmeasuerHouse), forControlEvents: .TouchUpInside)//按钮事件
        
        
        designer = UILabel(frame: CGRectMake(10, measuerHouse.frame.maxY + 5, name.frame.width, 25))
        designer.text = lableInfo[indexPath.row + 8]
        designer.font = UIFont.systemFontOfSize(15)
        designer.textColor = UIColor.greenColor()
        
        designerTxt = UITextField(frame: CGRectMake(designer.frame.maxX + 10, designer.frame.minY, mainSize.width - designer.frame.maxX - 110, 25))
        designerTxt.placeholder = "当前页面不可选择"
        designerTxt.adjustsFontSizeToFitWidth = true
        designerTxt.layer.cornerRadius = 5
        designerTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        designerTxt.borderStyle = UITextBorderStyle.RoundedRect
        //        designerTxt.clearButtonMode = .Always
        designerTxt.autocapitalizationType = .None//首字母类型,默认关闭
        designerTxt.userInteractionEnabled = false//让按钮不可用
        
        designerType = UIButton(frame: CGRectMake(designerTxt.frame.maxX + 10, designerTxt.frame.minY, 80, 25))
        designerType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        designerType.setTitle("设计师", forState: UIControlState.Normal)
        designerType.titleLabel?.font = UIFont.systemFontOfSize(styleType.frame.height/1.5)
        designerType.layer.cornerRadius = 5//设置圆角
        designerType.backgroundColor = UIColor.darkGrayColor()//背景颜色灰色
        designerType.userInteractionEnabled = false//让按钮不可用
        designerType.addTarget(self, action: #selector(AddKeHuViewController.Adddesigner), forControlEvents: .TouchUpInside)//按钮事件
        
        
        projectDesigin = UILabel(frame: CGRectMake(10, designer.frame.maxY + 5, name.frame.width, 25))
        projectDesigin.text = lableInfo[indexPath.row + 9]
        projectDesigin.font = UIFont.systemFontOfSize(15)
        projectDesigin.textColor = UIColor.greenColor()
        
        projectDesiginTxt = UITextField(frame: CGRectMake(projectDesigin.frame.maxX + 10, projectDesigin.frame.minY, mainSize.width - projectDesigin.frame.maxX - 110, 25))
        projectDesiginTxt.placeholder = "当前页面不可选择"
        projectDesiginTxt.adjustsFontSizeToFitWidth = true
        projectDesiginTxt.layer.cornerRadius = 5
        projectDesiginTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        projectDesiginTxt.borderStyle = UITextBorderStyle.RoundedRect
        //        projectDesiginTxt.clearButtonMode = .Always
        projectDesiginTxt.autocapitalizationType = .None//首字母类型,默认关闭
        projectDesiginTxt.userInteractionEnabled = false
        
        projectDesiginType = UIButton(frame: CGRectMake(projectDesiginTxt.frame.maxX + 10, projectDesiginTxt.frame.minY, 80, 25))
        projectDesiginType.setTitleColor(UIColor.redColor(), forState: .Highlighted)//点击之后变红色
        projectDesiginType.setTitle("提交方案", forState: UIControlState.Normal)
        projectDesiginType.titleLabel?.font = UIFont.systemFontOfSize(projectDesiginType.frame.height/1.5)
        projectDesiginType.layer.cornerRadius = 5//设置圆角
        projectDesiginType.backgroundColor = UIColor.darkGrayColor()//背景颜色
        projectDesiginType.userInteractionEnabled = false//让按钮不可用
        projectDesiginType.addTarget(self, action: #selector(AddKeHuViewController.AddprojectDesigin), forControlEvents: .TouchUpInside)//按钮事件
        
        trasactionPrice = UILabel(frame: CGRectMake(10, projectDesigin.frame.maxY + 5, name.frame.width, 25))
        trasactionPrice.text = lableInfo[indexPath.row + 10]
        trasactionPrice.font = UIFont.systemFontOfSize(15)
        trasactionPrice.textColor = UIColor.greenColor()
        
        trasactionPriceTxt = UITextField(frame: CGRectMake(trasactionPrice.frame.maxX + 10, trasactionPrice.frame.minY, mainSize.width - trasactionPrice.frame.maxX - 20, 25))
        trasactionPriceTxt.placeholder = "设计师或店长输入成交价格"
        trasactionPriceTxt.layer.cornerRadius = 5
        trasactionPriceTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        trasactionPriceTxt.borderStyle = UITextBorderStyle.RoundedRect
        trasactionPriceTxt.clearButtonMode = .Always
        trasactionPriceTxt.autocapitalizationType = .None//首字母类型,默认关闭
        trasactionPriceTxt.keyboardType = .NamePhonePad//设置键盘类型为数字类
        trasactionPriceTxt.userInteractionEnabled = false
        
        
        descr = UILabel(frame: CGRectMake(10, trasactionPrice.frame.maxY + 5, 40, 25))
        descr.text = lableInfo[indexPath.row + 11]
        descr.font = UIFont.systemFontOfSize(15)
        descr.textColor = UIColor.greenColor()
       
        descrTxt = UITextView(frame: CGRectMake(descr.frame.maxX + 10, descr.frame.minY, mainSize.width - descr.frame.maxX - 20, 50))
        descrTxt.layer.cornerRadius = 5
        //        descrTxt.layer.borderColor = UIColor.lightGrayColor().CGColor
        descrTxt.layer.borderWidth = 0.5
        descrTxt.layer.borderColor = UIColor.redColor().CGColor
        descrTxt.autocapitalizationType = .None//首字母类型,默认关闭
        descrTxt.selectable = false
        descrTxt.editable = true
        

        
        
        cell.contentView.addSubview(nameTxt)
        cell.contentView.addSubview(name)
        cell.contentView.addSubview(nameTxt)
        cell.contentView.addSubview(address)
        cell.contentView.addSubview(addressTxt)
        cell.contentView.addSubview(phone)
        cell.contentView.addSubview(phoneTxt)
        cell.contentView.addSubview(style)
        cell.contentView.addSubview(styleTxt)
        cell.contentView.addSubview(styleType)
        cell.contentView.addSubview(color)
        cell.contentView.addSubview(colorTxt)
        cell.contentView.addSubview(colorType)
        cell.contentView.addSubview(addTime)
        cell.contentView.addSubview(addTimeTxt)
        cell.contentView.addSubview(BusinessManager)
        cell.contentView.addSubview(BusinessManagerTxt)
        cell.contentView.addSubview(BusinessManagerType)
        cell.contentView.addSubview(measuerHouse)
        cell.contentView.addSubview(measuerHouseTxt)
        cell.contentView.addSubview(measuerHouseType)
        cell.contentView.addSubview(designer)
        cell.contentView.addSubview(designerTxt)
        cell.contentView.addSubview(designerType)
        cell.contentView.addSubview(projectDesigin)
        cell.contentView.addSubview(projectDesiginTxt)
        cell.contentView.addSubview(projectDesiginType)
        cell.contentView.addSubview(trasactionPrice)
        cell.contentView.addSubview(trasactionPriceTxt)
        cell.contentView.addSubview(descr)
        cell.contentView.addSubview(descrTxt)
        
        
        
        return cell
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
        record["trasactionPrice"] = self.trasactionPriceTxt.text//成交价格
        
        
        
        
        let query = AVQuery(className: "KeHuData")
        query.whereKey("phone", equalTo: self.phoneTxt.text)
        query.getFirstObjectInBackgroundWithBlock { (phone, e) in
            
            if self.nameTxt.text == "" && self.phoneTxt.text == "" && self.addressTxt.text == ""{
                self.alert.showAlert("警告", subTitle: "姓名,电话,地址为必填", style: AlertStyle.Warning)
            }else if phone != nil{
                self.alert.showAlert("警告", subTitle: "此手机号以注册不能重复注册", style: AlertStyle.Warning)
            }else{
                record.saveInBackgroundWithBlock { (_, e) in
                    if let e = e {
                        print(e.localizedDescription)
                        self.alert.showAlert("错误", subTitle: "检查网络,或联系软件制作人员", style: AlertStyle.Error)
                    } else {
                        print("保存成功！")
                        self.presentViewController(TB2ViewController(), animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
    
    func AddStyle() {
        print("添加风格")
        let alertController = UIAlertController(title: "选择店员", message: nil,
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        for 风格列表 in 风格{
            let b = UIAlertAction(title: "\(风格列表)", style: .Default, handler: { (_) in
                self.styleTxt.text = 风格列表
            })
            alertController.addAction(b)
        }
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func AddColor() {
        print("添加颜色")
        let alertController = UIAlertController(title: "选择店员", message: nil,
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        for 颜色列表 in 颜色{
            let b = UIAlertAction(title: "\(颜色列表)", style: .Default, handler: { (_) in
                self.colorTxt.text = 颜色列表
            })
            alertController.addAction(b)
        }
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func AddBusinessManager() {
        print("添加客户经理")
        let alertController = UIAlertController(title: "选择店员", message: nil,
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        for 店员列表 in 店员{
            let b = UIAlertAction(title: "\(店员列表)", style: .Default, handler: { (_) in
                self.BusinessManagerTxt.text = 店员列表
            })
            alertController.addAction(b)
        }
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func AddmeasuerHouse() {
        print("添加量房人员")
        let alertController = UIAlertController(title: "选择店员", message: nil,
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        for 店员列表 in 店员{
            let b = UIAlertAction(title: "\(店员列表)", style: .Default, handler: { (_) in
                self.measuerHouseTxt.text = 店员列表
            })
            alertController.addAction(b)
        }
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func Adddesigner() {
        print("添加设计师")
        let alertController = UIAlertController(title: "选择店员", message: nil,
                                                preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        for 店员列表 in 店员{
            let b = UIAlertAction(title: "\(店员列表)", style: .Default, handler: { (_) in
                self.designerTxt.text = 店员列表
            })
            alertController.addAction(b)
        }
        alertController.addAction(cancelAction)
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
    


//点击tableview之外的地方收回键盘
    func handleTap(sender: UITapGestureRecognizer) {
            if sender.state == .Ended {
                print("收回键盘")
                nameTxt.resignFirstResponder()
                addressTxt.resignFirstResponder()
                phoneTxt.resignFirstResponder()
                descrTxt.resignFirstResponder()
            }
        sender.cancelsTouchesInView = false
    }




//    func textFieldShouldReturn(textField: UITextField) -> Bool{//设置键盘点击之后隐藏
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {//隐藏键盘的另一种方法
////        nameTxt.resignFirstResponder()
////        addressTxt.resignFirstResponder()
////        phoneTxt.resignFirstResponder()
////        descrTxt.resignFirstResponder()
//        self.view.endEditing(true)
//
//    }
    
 
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
