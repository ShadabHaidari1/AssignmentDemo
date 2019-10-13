//
//  ProfileModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 25/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation

struct ProfileModel {
    
    var admissionNo : String
    var studentName : String
    var className : String
    var sectionName : String
    var rollNo : String
    var address : String
    var adhaarNo : String
    var mobileNo : String
    var emailID : String
    var studentImageUrl : String

    init(dictionary: Dictionary<String, Any>) {
        
        self.admissionNo = dictionary["AdmissionNo"] as! String
        self.studentName = dictionary["StudentName"] as! String
        self.className = dictionary["ClassName"] as! String
        self.sectionName = dictionary["SectionName"] as! String
        self.rollNo = dictionary["RollNo"] as! String
        self.address = dictionary["Address"] as! String
        self.adhaarNo = dictionary["AdhaarNo"] as! String
        self.mobileNo = dictionary["MobileNo"] as! String
        self.emailID = dictionary["EmailID"] as! String
        self.studentImageUrl = dictionary["StudentImageUrl"] as! String

    }
}
