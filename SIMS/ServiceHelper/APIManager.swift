//
//  APIManager.swift
//  Grocery
//
//  Created by Thinkbiz Solutions on 27/03/19.
//  Copyright © 2019 Thinkbiz Solutions. All rights reserved.
//

import Foundation
import Alamofire
//import SwiftyJSON
//
//class APIManager: NSObject {
//    class func postRequestWithParam(dicParam:[String:Any],strURL:String,completionHandler:@escaping (_ status:Bool,_ response:JSON)->()){
//
//        Alamofire.request(strURL, method: HTTPMethod.post, parameters: dicParam, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//
//            switch(response.result) {
//            case .success(_):
//                if response.result.value != nil{
//                    let swiftyJsonResponse = JSON(response.result.value!)
//                    completionHandler(true,swiftyJsonResponse)
//                    //print(response.result.value!)
//                }
//                break
//
//            case .failure(_):
//                completionHandler(false, JSON.null)
//                print(response.result.error!)
//                break
//
//            }
//        }
//    }
//}
//
//struct Constant{
//    static let API_DOMAIN = "http://demotbs.com/dev/grocery/webservices/"
//    static let LOGIN_API = API_DOMAIN + "login"
//   // http://demotbs.com/dev/grocery/webservices/login
//}
//
