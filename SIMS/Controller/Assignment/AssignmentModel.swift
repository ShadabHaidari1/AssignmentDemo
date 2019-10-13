//
//  AssignmentModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 21/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation
struct AssignmentModel {
    
    var assignmentId : Int
    var assignmentDate : String
    var assigmentSubmissionDate : String
    var assignmentDescription : String
    var assignmentFile : String
    var subjectName : String
    var teacherName : String

    init(dictionary: Dictionary<String, Any>) {
        
    self.assignmentId = dictionary["AssignmentId"] as! Int
    self.assignmentDate = dictionary["AssignmentDate"] as! String
    self.assigmentSubmissionDate = dictionary["AssigmentSubmissionDate"] as! String
    self.assignmentDescription = dictionary["AssignmentDescription"] as! String
    self.assignmentFile = dictionary["AssignmentFile"] as! String
    self.subjectName = dictionary["SubjectName"] as! String
    self.teacherName = dictionary["TeacherName"] as! String
    }
}


struct AssignmentStudentModel {
    
    var assignmentId : Int
    var assignmentDate : String
    var assigmentSubmissionDate : String
    var assignmentDescription : String
    var assignmentFile : String
    var submitedFile : String
    var uploadedByStudentDate : String
    var subjectName : String
    var teacherName : String
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.assignmentId = dictionary["AssignmentId"] as! Int
        self.assignmentDate = dictionary["AssignmentDate"] as! String
        self.assigmentSubmissionDate = dictionary["AssigmentSubmissionDate"] as! String
        self.assignmentDescription = dictionary["AssignmentDescription"] as! String
        self.assignmentFile = dictionary["AssignmentFile"] as! String
        self.submitedFile = dictionary["SubmitedFile"] as! String
        self.uploadedByStudentDate = dictionary["uploadedByStudentDate"] as! String
        self.subjectName = dictionary["SubjectName"] as! String
        self.teacherName = dictionary["TeacherName"] as! String
    }
}


struct AssignmentCheckedModel {
    
    var assignmentId : Int
    var assignmentDate : String
    var assigmentSubmissionDate : String
    var assignmentDescription : String
    var assignmentFile : String
    var submitedFile : String
    var uploadedByStudentDate : String
    var subjectName : String
    var teacherName : String
    var checkedRemarks : String
    var assignmentCheckedDate : String
    var status : Bool

    
    init(dictionary: Dictionary<String, Any>) {
        
        self.assignmentId = dictionary["AssignmentId"] as! Int
        self.assignmentDate = dictionary["AssignmentDate"] as! String
        self.assigmentSubmissionDate = dictionary["AssigmentSubmissionDate"] as! String
        self.assignmentDescription = dictionary["AssignmentDescription"] as! String
        self.assignmentFile = dictionary["AssignmentFile"] as! String
        self.submitedFile = dictionary["SubmitedFile"] as! String
        self.uploadedByStudentDate = dictionary["uploadedByStudentDate"] as! String
        self.subjectName = dictionary["SubjectName"] as! String
        self.teacherName = dictionary["TeacherName"] as! String
        self.checkedRemarks = dictionary["CheckedRemarks"] as! String
        self.assignmentCheckedDate = dictionary["AssignmentCheckedDate"] as! String
        self.status = dictionary["Status"] as! Bool

    }
}
