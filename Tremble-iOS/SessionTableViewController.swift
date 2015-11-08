//
//  SessionTableViewController.swift
//  Tremble-iOS
//
//  Created by Abduallah Al Mashmoum on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class SessionTableViewController: UITableViewController {

    private var sessionList:[SessionDetails]?
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
        
        cell.textLabel?.text = "Location: " + sessionList![indexPath.row].locationName + "\n" + "Course: " + sessionList![indexPath.row].courseName
        
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

}