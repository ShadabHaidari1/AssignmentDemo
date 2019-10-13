//
//  LoginModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 21/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation



struct LoginModel {
    
    let UserID: String?
    let UserGroupID: Int?
    let OrganisationId: String?
    let BranchId: Int?
    let EmployeeID: String?
    let UserName: String?
    let Password: String?
    let ExpiryDate: String?
    let LeftDays: String?
    let UserGroupName: String?
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.UserID = dictionary["UserID"] as? String
        self.UserGroupID = dictionary["UserGroupID"] as? Int
        self.OrganisationId = dictionary["OrganisationId"] as? String
        self.BranchId = dictionary["BranchId"] as? Int
        self.EmployeeID = dictionary["EmployeeID"] as? String
        self.UserName = dictionary["UserName"] as? String
        self.Password = dictionary["Password"] as? String
        self.ExpiryDate = dictionary["ExpiryDate"] as? String
        self.LeftDays = dictionary["LeftDays"] as? String
        self.UserGroupName = dictionary["UserGroupName"] as? String
        
    }
}
