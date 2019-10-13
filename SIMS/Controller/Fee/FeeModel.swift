//
//  FeeModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 27/09/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation

struct FeeModel {
    
    var MonthName : String?
    var ReceiptNo : String?
    var AdmissionNo : String?
    var StudentName : String?
    var ClassName : String?
    var SectionName : String?
    var TotalFee : Int?
    var PaidAmount : Int?
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.MonthName = dictionary["MonthName"] as? String
        self.ReceiptNo = dictionary["ReceiptNo"] as? String
        self.AdmissionNo = dictionary["AdmissionNo"] as? String
        self.StudentName = dictionary["StudentName"] as? String
        self.ClassName = dictionary["ClassName"] as? String
        self.SectionName = dictionary["SectionName"] as? String
        self.TotalFee = dictionary["TotalFee"] as? Int
        self.PaidAmount = dictionary["PaidAmount"] as? Int

    }
}
