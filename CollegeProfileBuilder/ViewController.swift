//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 2/23/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var editButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!
    var collegesArray: [Colleges] = [Colleges]()
    
    var nameVariable = ""
    var locationVariable = ""
    var numberOfStudents = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButtonOutlet.tag = 0
        
        let collegeZero = Colleges(Name: "Michigan State", NumberOfStudents: 40000 , Location: "East Lansing, Michigan", Image: "Michigan State")
        collegesArray.append(collegeZero)
        let collegeOne = Colleges(Name: "Wichita State", NumberOfStudents: 90000, Location: "Wichita, Kansas", Image: "WichitaState")
        collegesArray.append(collegeOne)
        let collegeTwo = Colleges(Name: "Kansas", NumberOfStudents: 80000, Location: "Lawrence, Kansas", Image: "Kansas")
        collegesArray.append(collegeTwo)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:", name:"load", object: nil)
    }
    
    func loadList(notification: NSNotification){
        self.myTableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        let currentCollege = collegesArray[indexPath.row]
        currentCell.textLabel?.text = currentCollege.name
        currentCell.backgroundColor = UIColor.blueColor()
        currentCell.detailTextLabel?.text = currentCollege.location
        
        return currentCell

    }
    //Stretch 3
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            collegesArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
    }
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! DetailsViewController
        let currentCollege = collegesArray[(myTableView.indexPathForSelectedRow?.row)!]
        NVC.currentCollege = currentCollege

    }

    @IBAction func addButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a College", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        

        var nameField: UITextField!
        var locationField: UITextField!
        var numberField: UITextField!
        
        func nameTextField(textField: UITextField!)
        {
            textField.placeholder = "College Name"
            nameField = textField
        }
        func locationTextField(textField: UITextField!)
        {
            textField.placeholder = "Location"
            locationField = textField
        }
        func numberTextField(textField: UITextField!)
        {
            textField.placeholder = "Number Of Students"
            numberField = textField
        }
        alert.addTextFieldWithConfigurationHandler(nameTextField)
        alert.addTextFieldWithConfigurationHandler(locationTextField)
        alert.addTextFieldWithConfigurationHandler(numberTextField)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler:
            { (action) -> Void in
                nameField.resignFirstResponder()
                
                let numberVariable = Int(numberField.text!)
                self.collegesArray.append(Colleges(Name: nameField.text!, NumberOfStudents: numberVariable!, Location: locationField.text!, Image : ""))
                self.myTableView.reloadData()
        })
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)

    }
    @IBAction func moveAround(sender: UIBarButtonItem) {
        if(sender.tag == 0){
            myTableView.editing = true
            sender.tag = 1
            editButtonOutlet.title = "Done"
            
        } else{
            myTableView.editing = false
            sender.tag = 0
            editButtonOutlet.title = "Edit"
        }
    }
    func TableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            collegesArray.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            myTableView.reloadData()
        }
    }
    /************************************/
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let itemToMove = collegesArray[fromIndexPath.row]
        collegesArray.removeAtIndex(fromIndexPath.row)
        collegesArray.insert(itemToMove, atIndex: toIndexPath.row)
        
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    


}