//
//  EventModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 24/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation


struct EventModel {
    
    var title : String
    var details : String
    var fromDate : String
    var toDate : String
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.title = dictionary["Title"] as! String
        self.details = dictionary["Details"] as! String
        self.fromDate = dictionary["FromDate"] as! String
        self.toDate = dictionary["ToDate"] as! String
    }
}


