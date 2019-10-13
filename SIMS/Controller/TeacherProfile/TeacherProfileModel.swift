//
//  TeacherProfileModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 24/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation


//
//struct TeacherProfiledModel {
//
//    var subjectID : String
//    var subjectName : String
//    var classId : String
//    var className : String
//    var sectionId : String
//    var employeeCode : String
//    var employeeId : String
//    var employeeName : String
//    var mobile : String
//    var image : String
//    var emailId : String
//    var sectionName : Bool
//
//
//    init(dictionary: Dictionary<String, Any>) {
//
//        self.subjectID = dictionary["AssignmentId"] as! String
//        self.subjectName = dictionary["AssignmentDate"] as! String
//        self.classId = dictionary["AssigmentSubmissionDate"] as! String
//        self.className = dictionary["AssignmentDescription"] as! String
//        self.sectionId = dictionary["AssignmentFile"] as! String
//        self.employeeCode = dictionary["SubmitedFile"] as! String
//        self.employeeId = dictionary["uploadedByStudentDate"] as! String
//        self.employeeName = dictionary["SubjectName"] as! String
//        self.mobile = dictionary["TeacherName"] as! String
//        self.image = dictionary["CheckedRemarks"] as! String
//        self.emailId = dictionary["AssignmentCheckedDate"] as! String
//        self.sectionName = dictionary["Status"] as! Bool
//
//    }
//}


struct TeacherProfileModel {
    let EmployeeName: String?
    let EmployeeId: String?
    let EmployeeCode: String?
    let CardNo: String?
    let Address: String?
    let Image: String?
    let EmailId: String?
    let Mobile: String?
    let SubjectName: String?
    let Gender: String?
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.EmployeeName = dictionary["EmployeeName"] as? String
        self.EmployeeId = dictionary["EmployeeId"] as? String
        self.EmployeeCode = dictionary["EmployeeCode"] as? String
        self.CardNo = dictionary["CardNo"] as? String
        self.Address = dictionary["Address"] as? String
        self.Image = dictionary["Image"] as? String
        self.EmailId = dictionary["EmailId"] as? String
        self.Mobile = dictionary["Mobile"] as? String
        self.SubjectName = dictionary["SubjectName"] as? String
        self.Gender = dictionary["Gender"] as? String


        
        
        
    }
    
}
