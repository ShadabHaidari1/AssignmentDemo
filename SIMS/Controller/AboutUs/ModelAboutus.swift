//
//  ModelAboutus.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 29/09/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation
struct AboutusModel {
    
    var AboutUs : String?
    var ContactNo : String?
  
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.AboutUs = dictionary["AboutUs"] as? String
        self.ContactNo = dictionary["ContactNo"] as? String
    
    }
}

