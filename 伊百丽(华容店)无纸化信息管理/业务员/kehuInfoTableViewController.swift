//
//  kehuInfoTableViewController.swift
//  伊百丽(华容店)无纸化信息管理
//
//  Created by 杨晶 on 16/5/15.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class kehuInfoTableViewController: UITableViewController {
    
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
    var info1: String!
    
    var 业务员权限: Bool = false
    var 设计师权限: Bool = true
    

    
    var lableInfo = ["姓名:","地址:","手机:","风格:","颜色:","报备日期:","客户经理:","量房:","设计师:","是否完成:","成交价格:","备注:"]
    


    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //格式化时间式样
        timeFormatter.dateFormat = "yyy-MM-dd"
//        let addTimeShow = timeFormatter.stringFromDate(addTime1) as String
        
        title = "客户详细信息"
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.rowHeight = 30
        
//        tableView.estimatedRowHeight = 30//cell的行高
//        tableView.rowHeight = UITableViewAutomaticDimension//自动行高
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return lableInfo.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        var lableInfo1 = ["\(name1)","\(address1)","\(phone1)","\(style1)","\(color1)","\(timeFormatter.stringFromDate(addTime1) as String)","\(BusinessManager1)","\(measuerHouse1)","\(designer1)","\(projectDesigin1)","\(trasactionPrice1)","\(descr1)"]

        
        
        let cell = UITableViewCell.init(style: UITableViewCellStyle.Value2, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        
        let textf = UITextField(frame: CGRectMake(80,2.5,230,25))
        textf.borderStyle = UITextBorderStyle.RoundedRect
        textf.adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
        textf.minimumFontSize=10  //最小可缩小的字号
        textf.font = UIFont.systemFontOfSize(15)
        textf.userInteractionEnabled = false
        textf.textAlignment = .Right//右对齐
        textf.text = lableInfo1[indexPath.row]
        
        let label = UILabel(frame: CGRectMake(10,2.5,60,25))
        label.font = UIFont.systemFontOfSize(13)
        label.text = lableInfo[indexPath.row]
        label.textColor = UIColor.greenColor()
        
        let descrTxt = UITextView(frame: CGRectMake(80,2.5,230,50))
        
        
        cell.contentView.addSubview(textf)
        cell.contentView.addSubview(label)
        // Configure the cell...
        if indexPath.row == 7 {
            textf.frame.size.width = 160
            var btn = UIButton(type: .ContactAdd)
            
            btn = UIButton(frame: CGRectMake(250, 2.5, 60, 25))
            btn.setTitle("量房", forState: UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(13)
            btn.layer.cornerRadius = 5//设置圆角
            btn.backgroundColor = UIColor.grayColor()//背景颜色
            btn.userInteractionEnabled = false
            btn.addTarget(self, action: #selector(RowInfoTableViewController.量房人员), forControlEvents: .TouchUpInside)//按钮事件
            cell.contentView.addSubview(btn)
        }else if indexPath.row == 8 {
            textf.frame.size.width = 160
            var btn = UIButton(type: .ContactAdd)
            
            btn = UIButton(frame: CGRectMake(250, 2.5, 60, 25))
            btn.setTitle("设计师", forState: UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(13)
            btn.layer.cornerRadius = 5//设置圆角
            btn.backgroundColor = UIColor.grayColor()//背景颜色
            btn.userInteractionEnabled = false
            btn.addTarget(self, action: #selector(RowInfoTableViewController.量房人员), forControlEvents: .TouchUpInside)//按钮事件
            cell.contentView.addSubview(btn)
        }else if indexPath.row == 9 {
            textf.frame.size.width = 160
            var btn = UIButton(type: .ContactAdd)
            
            btn = UIButton(frame: CGRectMake(250, 2.5, 60, 25))
            btn.setTitle("是否完成", forState: UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(13)
            btn.layer.cornerRadius = 5//设置圆角
            btn.backgroundColor = UIColor.grayColor()//背景颜色
            btn.userInteractionEnabled = false
            btn.addTarget(self, action: #selector(RowInfoTableViewController.量房人员), forControlEvents: .TouchUpInside)//按钮事件
            cell.contentView.addSubview(btn)
        }else if indexPath.row == 11 {
            tableView.rowHeight = 55
            cell.willRemoveSubview(textf)
            
            descrTxt.layer.cornerRadius = 5
            descrTxt.layer.borderWidth = 0.5
            descrTxt.layer.borderColor = UIColor.redColor().CGColor
            descrTxt.autocapitalizationType = .None//首字母类型,默认关闭
            descrTxt.text = descr1
            descrTxt.selectable = false
            descrTxt.editable = false
            cell.contentView.addSubview(descrTxt)
        }
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        tabBarController?.tabBar.hidden = true
    }
    
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        var lableInfo1 = ["\(name1)","\(address1)","\(phone1)","\(style1)","\(color1)","\(timeFormatter.stringFromDate(addTime1) as String)","\(BusinessManager1)","\(measuerHouse1)","\(designer1)","\(projectDesigin1)","\(trasactionPrice1)","\(budget1)","\(descr1)"]
//        
//        let vc: RowInfoTableViewController = RowInfoTableViewController()
//        vc.tag = indexPath.row
//        vc.lable = lableInfo1[indexPath.row]
//        vc.info = lableInfo[indexPath.row]
//                self.hidesBottomBarWhenPushed = true//结合userinfo 的代码实现单独隐藏导航
//        navigationController?.pushViewController(vc, animated: true)
//                self.hidesBottomBarWhenPushed = false//结合userinfo 的代码实现单独隐藏导航
//    }

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
