//
//  SessionTableViewController.swift
//  Tremble-iOS
//
//  Created by Abduallah Al Mashmoum on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit



class SessionTableViewController: UITableViewController {

    let manager = SessionConnection()
    var mySessionInfo:[SessionInfo]?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //self.navigationController!.view.drawRect(CGRectMake(89.4,199.8,200,100))

     
        manager.getUserSession { (sessionInfo) -> () in
        
            print("I AM IN THE SESSION TABLE")
            print(sessionInfo[0].location)
            print(sessionInfo[0].date)
            
            self.mySessionInfo = sessionInfo
            
            //print("mySssionInfo: ")
            //print(self.mySessionInfo![0].date)
            
            self.tableView.reloadData()
            
        }


        
        
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
        
        if self.mySessionInfo == nil {
            return 0
        }
        
        return mySessionInfo!.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mySessionCell", forIndexPath: indexPath)

        if self.mySessionInfo != nil && self.mySessionInfo!.count >= indexPath.row {
            

           let mainLabel = UILabel(frame: CGRectMake(0.0,100.0,220.0,30.0))
            mainLabel.font = UIFont.systemFontOfSize(14.0)
            mainLabel.textColor = UIColor.blackColor()
            mainLabel.text = mySessionInfo![0].location
            cell.contentView.addSubview(mainLabel)
            
            let dateLabel = UILabel(frame: CGRectMake(100.0,100.0,220.0,30.0))
            dateLabel.font = UIFont.systemFontOfSize(14.0)
            dateLabel.textColor = UIColor.blackColor()
            dateLabel.text = mySessionInfo![0].date
            cell.contentView.addSubview(dateLabel)
            
            
        }
     

        return cell
    }


//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
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
