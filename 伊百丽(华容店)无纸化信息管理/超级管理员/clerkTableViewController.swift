//
//  clerkTableViewController.swift
//  YBL数据管理
//
//  Created by 杨晶 on 16/5/19.
//  Copyright © 2016年 YJ. All rights reserved.
//
//店员显示页面

import UIKit

class clerkTableViewController: UITableViewController {


    var clerk: [AVObject] = []
    
    func getRecodFromCloud() {
        let query = AVQuery(className: "YBLclerk")
        query.findObjectsInBackgroundWithBlock { (objects, e) in
            guard e == nil else{
                print(e.localizedDescription)
                return
            }
            if let objects = objects as? [AVObject]{
                self.clerk = objects.reverse()
                NSOperationQueue.mainQueue().addOperationWithBlock{
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //注册cell
        getRecodFromCloud()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clerk.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        //复用cell
//        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        let data = clerk[indexPath.row]
        cell.textLabel?.text = data["name"] as? String

        return cell
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
