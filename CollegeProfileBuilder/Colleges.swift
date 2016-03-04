//
//  Colleges.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 2/23/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import Foundation

class Colleges
{
    var name: String
    var numberOfStudents: Int
    var location: String
    var image: String
        
    init(Name n: String, NumberOfStudents nos: Int, Location l: String, Image i: String)
    {
        name = n
        numberOfStudents = nos
        location = l
        image = i
           }
    init()
    {
        name = ""
        numberOfStudents = 0
        location = ""
        image = ""
            }
}
