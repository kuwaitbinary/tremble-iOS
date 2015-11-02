//
//  SessionTableViewController.swift
//  Tremble-iOS
//
//  Created by Abduallah Al Mashmoum on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class SessionTableViewController: UITableViewController {

    private var sessionList:[ActiveSession]?
    private var selectedSession = 0

    override func viewDidAppear(animated: Bool) {
        
        let manager = ConnectionManager()
        
        manager.getUserSession { (sessionList) -> () in
            
            self.sessionList = sessionList
            
            self.tableView.reloadData()
            
        }

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.sessionList == nil {
            
            return 0
            
        } else {
            
            return sessionList!.count
            
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        cell.textLabel!.numberOfLines = 2
        
        cell.textLabel?.text = "Location: " + sessionList![indexPath.row].locationName + "\n" + "Date: " + sessionList![indexPath.row].waveDate
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedSession = indexPath.row
        
        self.performSegueWithIdentifier("SessionDetails", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var sessionDetailsViewController = segue.destinationViewController as! SessionDetailsViewController
        
        sessionDetailsViewController.session = sessionList![selectedSession]
        
    }


//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("mySessionCell", forIndexPath: indexPath)
//
//        if self.mySessionInfo != nil && self.mySessionInfo!.count >= indexPath.row {
//            
//
//           let mainLabel = UILabel(frame: CGRectMake(0.0,100.0,220.0,30.0))
//            mainLabel.font = UIFont.systemFontOfSize(14.0)
//            mainLabel.textColor = UIColor.blackColor()
//            mainLabel.text = mySessionInfo![0].location
//            cell.contentView.addSubview(mainLabel)
//            
//            let dateLabel = UILabel(frame: CGRectMake(100.0,100.0,220.0,30.0))
//            dateLabel.font = UIFont.systemFontOfSize(14.0)
//            dateLabel.textColor = UIColor.blackColor()
//            dateLabel.text = mySessionInfo![0].date
//            cell.contentView.addSubview(dateLabel)
//            
//            
//        }
//     
//
//        return cell
//    }

}