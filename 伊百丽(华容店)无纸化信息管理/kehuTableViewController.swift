//
//  kehu2TableViewController.swift
//  伊百丽(华容店)无纸化信息管理
//
//  Created by 杨晶 on 16/4/25.
//  Copyright © 2016年 YJ. All rights reserved.
//

import UIKit

class kehuTableViewController: UITableViewController {
    
    var kehudata: [AVObject] = []
    var kehu: KeHuData!
    
    func getRecodFromCloud() {
        let query = AVQuery(className: "KeHuData")
        query.findObjectsInBackgroundWithBlock { (objects, e) in
            guard e == nil else{
                print(e.localizedDescription)
                return
            }
            if let objects = objects as? [AVObject]{
                self.kehudata = objects.reverse()
                NSOperationQueue.mainQueue().addOperationWithBlock{
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecodFromCloud()
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        tableView.reloadData()
    }
    
    func add() {
        self.hidesBottomBarWhenPushed = true//结合userinfo 的代码实现单独隐藏导航
        navigationController?.pushViewController(AddKeHuViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false//结合userinfo 的代码实现单独隐藏导航
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false//结合userinfo 的代码实现单独隐藏导航
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
        return kehudata.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("SwiftCell", forIndexPath: indexPath) as UITableViewCell
        let cell = UITableViewCell.init(style: .Subtitle, reuseIdentifier: "SwiftCell")
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        let data = kehudata[indexPath.row]
        cell.textLabel?.text = data["name"] as? String
        cell.detailTextLabel?.text = "电话:\(data["phone"] as! String)"
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc: kehuInfo1ViewController = kehuInfo1ViewController()
        let data = self.kehudata[indexPath.row]
        vc.name1 = data["name"] as? String
        vc.address1 = data.objectForKey("address") as? String
        vc.addTime1 = data.createdAt
        vc.budget1 = data.objectForKey("budget") as? String
        vc.BusinessManager1 = data.objectForKey("BusinessManager") as? String
        vc.color1 = data.objectForKey("color") as? String
        vc.descr1 = data.objectForKey("descr") as? String
        vc.designer1 = data.objectForKey("designer") as? String
        vc.info1 = data.objectForKey("info") as? String
        vc.measuerHouse1 = data.objectForKey("measuerHouse") as? String
        vc.phone1 = data.objectForKey("phone") as? String
        vc.projectDesigin1 = data.objectForKey("projectDesigin") as? String
        vc.style1 = data.objectForKey("style") as? String
        vc.trasactionPrice1 = data.objectForKey("trasactionPrice") as? String
        vc.objectID = data.objectId
        self.hidesBottomBarWhenPushed = true//结合userinfo 的代码实现单独隐藏导航
        navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false//结合userinfo 的代码实现单独隐藏导航
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false//结合userinfo 的代码实现单独隐藏导航
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
