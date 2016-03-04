//
//  DetailsViewController.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 2/24/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var currentCollege = Colleges()
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myTextField1: UITextField!
    @IBOutlet weak var myTextField2: UITextField!
    @IBOutlet weak var myTextField3: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = currentCollege.name
        
        myTextField1.text = currentCollege.name
        myTextField2.text = currentCollege.location
        myTextField3.text = "\(currentCollege.numberOfStudents)"
        myImage.image = UIImage(named: currentCollege.image)
    
    }
    @IBAction func saveButton(sender: UIButton) {

        currentCollege.name = myTextField1.text!
        currentCollege.location = myTextField2.text!
        currentCollege.numberOfStudents = (Int(myTextField3.text!))!
        
        self.navigationItem.title = currentCollege.name

        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)

    }
    
}