//
//  RowInfoTableViewController.swift
//  伊百丽(华容店)无纸化信息管理
//
//  Created by 杨晶 on 16/5/15.
//  Copyright © 2016年 YJ. All rights reserved.
//

//以废除不用了

import UIKit

class RowInfoTableViewController: UITableViewController {
    
    var tag: Int = 0
    var lable = ""
    var info = ""
    var 量房 = ["杨晶","王强","万杰"]
    
    var first: Bool = false//设置创建datepicker是否被创建
    
    var alert = SweetAlert()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let item = UIBarButtonItem(title: "更新", style: .Plain, target: self, action: #selector(RowInfoTableViewController.OK))
        navigationItem.setRightBarButtonItem(item, animated: true)
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.rowHeight = 30
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
        return 1
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell.init(style: UITableViewCellStyle.Value2, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        
        let textf = UITextField(frame: CGRectMake(80,2.5,230,25))
        textf.borderStyle = UITextBorderStyle.RoundedRect
        textf.adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
        textf.minimumFontSize=10  //最小可缩小的字号
        textf.font = UIFont.systemFontOfSize(15)
        textf.userInteractionEnabled = false
        textf.textAlignment = .Right//右对齐
        textf.text = lable
        
        let label1 = UILabel(frame: CGRectMake(10,2.5,60,25))
        label1.font = UIFont.systemFontOfSize(13)
        label1.text = info
        label1.textColor = UIColor.greenColor()
        
        cell.contentView.addSubview(textf)
        cell.contentView.addSubview(label1)
        // Configure the cell...
        switch tag {
        case 7,8,9,10:
            textf.frame.size.width = 160
            var btn = UIButton(type: .ContactAdd)
            
            btn = UIButton(frame: CGRectMake(250, 2.5, 60, 25))
            btn.setTitle("量房", forState: UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(15)
            btn.layer.cornerRadius = 5//设置圆角
            btn.backgroundColor = UIColor.blueColor()//背景颜色
            btn.addTarget(self, action: #selector(RowInfoTableViewController.量房人员), forControlEvents: .TouchUpInside)//按钮事件
            cell.contentView.addSubview(btn)
        default:
            print(tag)
            
        }

        return cell
    }
    

//
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 量房.count
//    }
//    
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return 量房[row]
//    }
    
    
    func 量房人员() {
        if first == false {
            let inputeView = UIView(frame: CGRectMake(5,250,310,400))
            let datepicker = UIDatePicker(frame: CGRectMake(5,35,310,240))
            inputeView.addSubview(datepicker)
            self.view.addSubview(inputeView)
            first = true
        }else{
            
            alert.showAlert("不能重复创建")
//            let alert = UIAlertController(title: "警告", message: "不能创建多个选择器", preferredStyle: .ActionSheet)
//            let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
//            alert.addAction(action)
//        presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    func OK() {
            print("啥也美发生")
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
