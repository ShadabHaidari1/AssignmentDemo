//
//  AttendanceModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 27/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation

struct AttendanceModel {
    
    var attendanceDate : String
    var attendanceStatus : Bool
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.attendanceDate = dictionary["AttendanceDate"] as! String
        self.attendanceStatus = dictionary["AttendanceStatus"] as! Bool
    }
}
