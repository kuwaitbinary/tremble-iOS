//
//  EvaluationTableViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 11/3/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class EvaluationTableViewController: UITableViewController {
    
    private let manager = ConnectionManager()
    private var questionList = [Question]()
    private var questionListSectionOne = [Question]()
    private var questionListSectionTwo = [Question]()
    private var questionListSectionThree = [Question]()
    private var questionListSectionFour = [Question]()
    private var numberOfRows = [Int]()
    private var flag = false
    
    @IBAction func submitAction(sender: AnyObject) {
        
        
        if self.checkIfAllQuestionsAnswered() {
            
            self.storeAnswersInOneArray()
            self.manager.evaluationAnswers(questionList)
            
            let alert = UIAlertController(title: "", message: "The Evaluation Has Been Submitted.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction (title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                
                self.navigationController?.popViewControllerAnimated(true)
                
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "", message: "Please answer all the questions.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        manager.getQuestions { (numberOfRows, questionList) -> () in
            
            self.numberOfRows = numberOfRows
            self.questionList = questionList
            
            for(var i = 0; i < questionList.count; i++) {
                
                switch(questionList[i].section) {
                    
                case 1:
                    self.questionListSectionOne.append(questionList[i])
                    break
                case 2:
                    self.questionListSectionTwo.append(questionList[i])
                    break
                case 3:
                    self.questionListSectionThree.append(questionList[i])
                    break
                case 4:
                    self.questionListSectionFour.append(questionList[i])
                    break
                default:
                    break
                    
                }
                
            }
            
            self.flag = true
            
            self.tableView.reloadData()
            
        }
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if flag == false {
            return 1
        } else {
            return numberOfRows[section]
        }
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch(section) {
            
        case 0:
            return "Course"
        case 1:
            return "Trainer"
        case 2:
            return "Location"
        case 3:
            return "Coordintor"
        default:
            return ""
            
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if flag == true {
            
            switch(indexPath.section) {
                
                case 0:
                
                    if questionListSectionOne[indexPath.row].answer == 0 {
                        
                        cell.textLabel?.text = questionListSectionOne[indexPath.row].question
                        
                    } else {
                        
                        cell.textLabel?.text = self.viewCellTextLabel(questionListSectionOne[indexPath.row].answer, question: questionListSectionOne[indexPath.row].question)
                        cell.textLabel?.textColor = UIColor.orangeColor()
                        
                    }
                    
                    break
                
                case 1:
                
                    if questionListSectionTwo[indexPath.row].answer == 0 {
                        
                        cell.textLabel?.text = questionListSectionTwo[indexPath.row].question
                        
                    } else {
                        
                        cell.textLabel?.text = self.viewCellTextLabel(questionListSectionTwo[indexPath.row].answer, question: questionListSectionTwo[indexPath.row].question)
                        cell.textLabel?.textColor = UIColor.orangeColor()
                        
                    }
                    
                break
                
                case 2:
                
                    if questionListSectionThree[indexPath.row].answer == 0 {
                        
                        cell.textLabel?.text = questionListSectionThree[indexPath.row].question
                        
                    } else {
                        
                        cell.textLabel?.text = self.viewCellTextLabel(questionListSectionThree[indexPath.row].answer, question: questionListSectionThree[indexPath.row].question)
                        cell.textLabel?.textColor = UIColor.orangeColor()
                        
                    }
                    
                break
                
                case 3:
                
                    if questionListSectionFour[indexPath.row].answer == 0 {
                        
                        cell.textLabel?.text = questionListSectionFour[indexPath.row].question
                        
                    } else {
                        
                        cell.textLabel?.text = self.viewCellTextLabel(questionListSectionFour[indexPath.row].answer, question: questionListSectionFour[indexPath.row].question)
                        cell.textLabel?.textColor = UIColor.orangeColor()
                        
                    }
                    
                break
                
                default:
                break
                
            }
            
        }
        
        return cell
        
    }
    
    func viewCellTextLabel(answerNumber:Int, question:String) -> String {
        
        var answer = ""
        
        switch(answerNumber) {
            case 1:
                answer = "Very Bad"
                break
            case 2:
                answer = "Bad"
                break
            case 3:
                answer = "Fair"
                break
            case 4:
                answer = "Good"
                break
            case 5:
                answer = "Very Good"
            default:
                break
        }
        
        return question + "  " + answer
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertController(title: "", message: "Please Choose Your Answer.", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction (title: "Very Bad", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            self.storeAnswer(1, section: indexPath.section, row: indexPath.row)
            
        }))
        
        alert.addAction(UIAlertAction (title: "Bad", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            self.storeAnswer(2, section: indexPath.section, row: indexPath.row)
            
        }))
        
        alert.addAction(UIAlertAction (title: "Fair", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            self.storeAnswer(3, section: indexPath.section, row: indexPath.row)
            
        }))
        
        alert.addAction(UIAlertAction (title: "Good", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            self.storeAnswer(4, section: indexPath.section, row: indexPath.row)
            
        }))
        
        alert.addAction(UIAlertAction (title: "Very Good", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            self.storeAnswer(5, section: indexPath.section, row: indexPath.row)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func storeAnswer(answer:Int, section:Int, row:Int) {
        
        switch(section) {
            
        case 0:
            questionListSectionOne[row].answer = answer
            break
        case 1:
            questionListSectionTwo[row].answer = answer
            break
        case 2:
            questionListSectionThree[row].answer = answer
            break
        case 3:
            questionListSectionFour[row].answer = answer
            break
        default:
            break
            
        }
        
        self.tableView.reloadData()
        
    }
    
    func storeAnswersInOneArray() {
        
        var found:Bool
        
        for(var i = 0; i < questionList.count; i++) {
            
            found = false
            
            for(var j = 0; j < questionListSectionOne.count; j++) {
                
                if questionList[i].id == questionListSectionOne[j].id {
                    found = true
                    questionList[i].answer = questionListSectionOne[j].answer
                    break
                }
                
            }
            
            if found == false {
                
                for(var j = 0; j < questionListSectionTwo.count; j++) {
                    
                    if questionList[i].id == questionListSectionTwo[j].id {
                        found = true
                        questionList[i].answer = questionListSectionTwo[j].answer
                        break
                    }
                    
                }
                
            }
            
            if found == false {
                
                for(var j = 0; j < questionListSectionThree.count; j++) {
                    
                    if questionList[i].id == questionListSectionThree[j].id {
                        found = true
                        questionList[i].answer = questionListSectionThree[j].answer
                        break
                    }
                    
                }
                
            }
            
            if found == false {
                
                for(var j = 0; j < questionListSectionFour.count; j++) {
                    
                    if questionList[i].id == questionListSectionFour[j].id {
                        found = true
                        questionList[i].answer = questionListSectionFour[j].answer
                        break
                    }
                    
                }
                
            }
            
        }
        
    }
    
    func checkIfAllQuestionsAnswered() -> Bool {
        
        for(var i = 0; i < questionListSectionOne.count; i++) {
            
            if questionListSectionOne[i].answer == 0 {
                return false
            }
            
        }
        
        for(var i = 0; i < questionListSectionTwo.count; i++) {
            
            if questionListSectionTwo[i].answer == 0 {
                return false
            }
            
        }
        
        for(var i = 0; i < questionListSectionThree.count; i++) {
            
            if questionListSectionThree[i].answer == 0 {
                return false
            }
            
        }
        
        for(var i = 0; i < questionListSectionFour.count; i++) {
            
            if questionListSectionFour[i].answer == 0 {
                return false
            }
            
        }
        
        
        return true
        
    }

}