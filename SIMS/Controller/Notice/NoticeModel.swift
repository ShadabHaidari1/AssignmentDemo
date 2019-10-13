//
//  NoticeModel.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 21/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation

struct NoticeModel {
    
    var noticeBoardId : Int
    var message : String
    var subject : String
    var createdOn : String
    
    init(dictionary: Dictionary<String, Any>) {
        
        self.noticeBoardId = dictionary["NoticeBoardId"] as! Int
        self.message = dictionary["Message"] as! String
        self.subject = dictionary["Subject"] as! String
        self.createdOn = dictionary["CreatedOn"] as! String

    }
}
