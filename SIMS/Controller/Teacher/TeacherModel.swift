//
//  TeacherModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 21/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation

struct TeacherModel {
    
    var SubjectID : Int
    var ClassId : Int
    var SectionId : Int
    var SubjectName : String
    var ClassName : String
    var SectionName : String
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.SubjectID = dictionary["SubjectID"] as! Int
        self.SubjectName = dictionary["SubjectName"] as! String
        self.ClassName = dictionary["ClassName"] as! String
        self.ClassId = dictionary["ClassId"] as! Int
        self.SectionId = dictionary["SectionId"] as! Int
        self.SectionName = dictionary["SectionName"] as! String

        
    }
}
