//
//  ServiceHelper.swift
//  IT Shades
//
//  Created by Thinkbiz Solutions on 19/07/18.
//  Copyright © 2018 thinkbiz. All rights reserved.
//

import Foundation
import Alamofire
//http://school.cloudisnext.com/employeeimage/cef36703-42b4-4a4c-b2c6-439bebfc3f5c.jpg
//http://school.cloudisnext.com/assignment/064dde67-fb2a-4a24-bae6-616d934b05dc.pdf
var baseURL = "http://www.schoolwebservices.cloudisnext.com/SIMS.asmx/"
var imageURL = "http://school.cloudisnext.com/"
protocol ServiceHelperDelegate {
    func serviceResponseWithError(error:Error, serviceName:ServiceMethod);
    func serviceResponseWithSuccess(response:Any, serviceName:ServiceMethod);
}

enum ServiceMethod: String {

       // **** User Account related Services *** //
    case Service_StudentDetailsById = "StudentDetailsById"
    case Service_SubjectByClassAndSectionId = "SubjectByClassAndSectionId"
    case Service_AssignmentUploadByTeacher = "AssignmentUploadByTeacher"
    case Service_AssignmentSubmittedByStudent = "AssignmentSubmittedByStudent"
    case Service_AssignmentCheckedByTeacher = "AssignmentCheckedByTeacher"
    case Service_TeacherByClassAndSectionId = "TeacherByClassAndSectionId"
    case Service_ValidateUser = "ValidateUser"
    
    
    case Service_StudentAttendance = "StudentAttendance"
    case Service_TeacherWithSubject = "TeacherWithSubject"
    case Service_FeePaymentByStudent = "FeePaymentByStudent"
    case Service_FetchAboutUs = "FetchAboutUs"


    //http://www.schoolwebservices.cloudisnext.com/SIMS.asmx/ValidateUser
    

    case Service_Notice = "Notice"
    case Service_Holiday = "Holiday"
    case Service_Event = "Event"

  //  http://www.schoolwebservices.cloudisnext.com/SIMS.asmx/FeePaymentByStudent
    
    
    
    case Service_Top_offer = "top_offer"
    case Service_GetTopCategory = "getTopCategory"
    case Service_GetAllCategory = "getAllCategory"
    case Service_ProductBycategory = "productBycategory?id="
    case Service_DealsOfDay = "deal_of_day"
    case Service_UnderEuroOne = "under_euro"
    case Service_under_discount = "under_discount"
    case Service_best_seller = "best_seller"
    case Service_Login = "login"
    case Service_LoginLogo = "login_image"
    case Service_Advertise = "advertise_image"
    case Service_HomeBanner = "main_image"
    case Service_Registration = "registration?"
    case Service_AddtoCart = "add_to_cart"
    case Service_getAllCart = "getAllCart?user_id="
    case Service_forget_password = "forget_password"
    case Service_update_cart = "update_cart?"
    case Service_RandomSearch = "searchdata?search="
    case Service_Order = "order?"
    case Service_OrderHistory = "orderitem?user_id="
    case Service_DeleteCart = "delete_cart?cart_id="
    case Service_getAllorder = "getAllorder?user_id="
    case Service_getAllorderDetail = "getAllorder_item?order_id="
    case Service_aboutUS = "about_us"
    case Service_contact_address = "contact_address"
    case Service_contactForm = "contactForm?"
    case Service_ShippingAddress = "shipping_address?"
    case Service_CollectByStore = "collectByStore?"
    case Service_Reorder = "reorder?id="
    // http://demotbs.com/dev/grocery/webservices/reorder?id=135&user_id=11
    case none
  
}

class ServiceHelper: NSObject{
    
    var parameters = Dictionary<String,Any>()
    var delegate:ServiceHelperDelegate?
    var headers: HTTPHeaders = [:]
    var sessionCookie : String = ""
    let cookieDefault:UserDefaults = UserDefaults.standard
    var serviceMethodType : ServiceMethod = ServiceMethod.none
    
    func callWebService ( endPointMethodName : ServiceMethod, httpMethod: String , params: Dictionary<String,Any>?){
        
        var url : String = baseURL + endPointMethodName.rawValue
        
        switch endPointMethodName {
            
        case .Service_Notice:         //Consumed New Service_Notice
            
            print("Service_Notice",url)
            break

        case .Service_Holiday:         //Consumed New Service_Holiday
            
            print("Service_Holiday",url)
            break
            
        case .Service_Event:         //Consumed New Service_Event
            
            print("Service_Event",url)
            break
            
        case .Service_StudentDetailsById:    //Consumed New StudentDetailsById
            
            if let BranchId = params?["BranchId"] ,
                let StudentId = params?["StudentId"] {
                
                parameters["BranchId"] = BranchId
                parameters["StudentId"] = StudentId
                
            }
            break

        case .Service_ValidateUser:    //Consumed New Service_ValidateUser
           
            if let UserName = params?["UserName"],
               let Password = params?["Password"] {
                
                parameters["UserName"] = UserName
                parameters["Password"] = Password
                
            }
             break
            
        case .Service_StudentAttendance:    // Service_StudentAttendance
            
            if let BranchId = params?["BranchId"] ,
                let StudentId = params?["StudentId"] {
                
                parameters["BranchId"] = BranchId
                parameters["StudentId"] = StudentId
                
            }
            break
            
        case .Service_FeePaymentByStudent:    // Service_FeePaymentByStudent
            
            if let BranchId = params?["BranchId"] ,
                let StudentId = params?["StudentId"] {
                
                parameters["BranchId"] = BranchId
                parameters["StudentId"] = StudentId
                
            }
            break
            
        case .Service_FetchAboutUs:    // Service_FetchAboutUs
            
            if let BranchId = params?["BranchId"]
                 {
                
                parameters["BranchId"] = BranchId
                
            }
            break

            
            
        case .Service_SubjectByClassAndSectionId:    //Consumed New StudentDetailsById
            
             if let branchId = params?["BranchId"] ,
                let classId = params?["ClassId"] ,
                let sectionId = params?["SectionId"]
            {
                parameters["BranchId"] = branchId
                parameters["ClassId"] = classId
                parameters["SectionId"] = sectionId
            }
            break
            
            
        case .Service_TeacherByClassAndSectionId:    //TeacherByClassAndSectionId
            
            if let subjectId = params?["SubjectId"] ,
                let classId = params?["ClassId"] ,
                let sectionId = params?["SectionId"]
            {
                parameters["SubjectId"] = subjectId
                parameters["ClassId"] = classId
                parameters["SectionId"] = sectionId
            }
            break

            
            
            
            
            
            
            
            
            
            
            
            
            
        case .Service_AssignmentUploadByTeacher:  //AssignmentUploadByTeacher

            if let BranchId = params?["BranchId"] ,
                let StudentId = params?["StudentId"] {

                parameters["BranchId"] = BranchId
                parameters["StudentId"] = StudentId
            }
            
            break
            
        case .Service_AssignmentSubmittedByStudent:  //AssignmentSubmittedByStudent
            
            if let BranchId = params?["BranchId"] ,
                let StudentId = params?["StudentId"] {
                
                parameters["BranchId"] = BranchId
                parameters["StudentId"] = StudentId
            }
            
            break
            
        case .Service_AssignmentCheckedByTeacher:  //AssignmentCheckedByTeacher
            
            if let BranchId = params?["BranchId"] ,
                let StudentId = params?["StudentId"] {
                
                parameters["BranchId"] = BranchId
                parameters["StudentId"] = StudentId
            }
            
            break
            
        case .Service_TeacherWithSubject:  //Assignment Service_TeacherWithSubject
            
            if let BranchId = params?["BranchId"] ,
                let StudentId = params?["StudentId"] {
                
                parameters["BranchId"] = BranchId
                parameters["StudentId"] = StudentId
            }
            
            break

            
      
            
            
            
        case .Service_forget_password:      //Consumed New Service_forget_password
            
            if let email = params?["email"]  {
                parameters["email"] = email
                
            }
            break
            
        case .Service_AddtoCart:            //Consumed New Service_AddtoCart
            
            if let id = params?["id"] , let quantity = params?["quantity"] ,let user_id = params?["user_id"] {
                
                parameters["id"] = id
                parameters["quantity"] = quantity
                parameters["user_id"] = user_id
            }

            break
                        
        case .Service_update_cart:             //Consumed New Service_update_cart
            if let quantity = params?["quantity"],
                let cart_id = params?["cart_id"]
                
            {
                url = url + "quantity=" + "\(quantity)" + "&cart_id=" + "\(cart_id)"
                print(url)
            }
            
            break
            
  
        case .Service_ShippingAddress:       //Consumed New Service_ShippingAddress
            
            if let user_id = params?["user_id"],
                let name = params?["name"],
                let street_name = params?["street_name"],
                let town = params?["town"],
                let postal_code = params?["postal_code"],
                let contact_number = params?["contact_number"]

            {
               let params = "user_id=" + "\(user_id)" + "&name=" + "\(name)"  + "&street_name=" + "\(street_name)" + "&town=" + "\(town)" + "&postal_code=" + "\(postal_code)" + "&contact_number=" + "\(contact_number)"
               
                if let paramsWithEncoded = params.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
                    url = url + paramsWithEncoded
                 
                }
            }

            break
            

        case .Service_CollectByStore:       //Consumed New Service_ShippingAddress
            
            if let user_id = params?["user_id"],
                let date_time = params?["date_time"],
                let total_amount = params?["total_amount"]
                
            {
                let params = "user_id=" + "\(user_id)" + "&date_time=" + "\(date_time)" + "&total_amount=" + "\(total_amount)"
                
                if let paramsWithEncoded = params.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
                    url = url + paramsWithEncoded
                    
                }
            }
            
            break

          
        case .Service_getAllCart:
            url = url + "\(params!["user_id"]!)"
            print(url)
            break
            
        case .Service_getAllorder:
            url = url + "\(params!["user_id"]!)"
            print(url)
            break
           
        case .Service_getAllorderDetail:
            url = url + "\(params!["user_id"]!)"
            print(url)
            break
            
        case .Service_DeleteCart:
            url = url + "\(params!["cart_id"]!)"
            print(url)
            break
            
            
        case .Service_Reorder:         //Consumed New Service_Reorder
            
            url = url + "\(params!["user_id"]!)"
            print(url)
            break

        case .Service_aboutUS:
            print("Service_aboutUS",url)
            
            break
            
        case .Service_GetTopCategory:
             print("Service_GetTopCategory",url)
           
            break
            
        case .Service_ProductBycategory:    //Consumed New Service_GetTopCategory
            
            url = url + "\(params!["cart_id"]!)"
            print(url)
            break
            
        case .Service_GetAllCategory:         //Consumed New Service_GetAllCategory
            
            print("Service_GetAllCategory",url)
            break
        case .Service_Top_offer:         //Consumed New Service_Top_offer
            
            print("Service_Top_offer",url)
            break
        case .Service_LoginLogo:         //Consumed New Service_LoginLogo
            
            print("Service_LoginLogo",url)
            break
        case .Service_HomeBanner:         //Consumed New Service_HomeBanner
            
            print("Service_HomeBanner",url)
            break
            
        case .Service_Advertise:         //Consumed New Service_Advertise
            
            print("Service_Advertise",url)
            break
       
            
     
        case .Service_DealsOfDay:         //Consumed New Service_DealsOfDay
            
            print("Service_DealsOfDay",url)
            break
        case .Service_UnderEuroOne:       //Consumed New Service_UnderEuroOne
            
            print("Service_UnderEuroOne",url)
            break
        case .Service_under_discount:       //Consumed New Service_under_discount
            
            print("Service_under_discount",url)
            break
        case .Service_best_seller:         //Consumed New Service_best_seller
            
            print("Service_best_seller",url)
            break
        case .Service_contact_address:         //Consumed New Service_best_seller
            
            print("Service_contact_address",url)
            break
            
            //Service_contact_address
            
            
        case .Service_RandomSearch:
            url = url + "\(params!["catId"]!)"
            
        case .Service_OrderHistory:
            url = url + "\(params!["userID"]!)"
            print(url)
            break
         
        case .Service_Order:          //Consumed New Service_Order
            
            if  let name = params?["name"],
                let email = params?["email"],
                let phone = params?["pho"],
                let city = params?["city"],
                let zip_code = params?["zip_code"],
                let address = params?["address"],
                let message = params?["message"],
                let user_id = params?["user_id"],
                let product_id = params?["product_id"],
                let productQuantity = params?["productQuantity"]
                
            {
                
                let params = "name=" + "\(name)" + "&email=" + "\(email)" + "&pho=" + "\(phone)" + "&city=" + "\(city)" + "&zip_code=" + "\(zip_code)" + "&address=" + "\(address)" + "&user_id=" + "\(user_id)" + "&product_id=" + "\(product_id)" + "&productQuantity=" + "\(productQuantity)" + "&message=" + "\(message)"
                
                if let paramsWithEncoded = params.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
                    url = url + paramsWithEncoded
                    print(url)
                }
            }
            break
        default:
            print("default")
            break
        }
        
        switch endPointMethodName {
       
        case  .Service_UnderEuroOne,.Service_under_discount,.Service_best_seller, .Service_Order, .Service_OrderHistory, .Service_DealsOfDay, .Service_RandomSearch, .Service_aboutUS :
                        Alamofire.request(url, method: (httpMethod.lowercased() == "post") ? .post : .get , headers: headers)
                            .responseString { response in
                                print("Level 2")
                                switch response.result {
                                case .success:
                                    print("Validation Successful")
                                    self.delegate?.serviceResponseWithSuccess(response:response.result.value!, serviceName:endPointMethodName)
                                case .failure(let error):
                                    print(error)
                                    self.delegate?.serviceResponseWithError(error:response.result.error!, serviceName:endPointMethodName)
                        }
                    }
        case .Service_StudentDetailsById, .Service_Notice , .Service_SubjectByClassAndSectionId, .Service_AssignmentUploadByTeacher, .Service_AssignmentSubmittedByStudent, .Service_AssignmentCheckedByTeacher, .Service_TeacherByClassAndSectionId, .Service_Holiday, .Service_Event, .Service_StudentAttendance, .Service_TeacherWithSubject, .Service_FeePaymentByStudent, .Service_FetchAboutUs, .Service_ValidateUser :
            print("params :", parameters)
            Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
                .responseJSON { response in
                    print("Level 2")
                    switch response.result {
                    case .success:
                        print("Validation Successful",response.result)
                        self.delegate?.serviceResponseWithSuccess(response:response.result.value!, serviceName:endPointMethodName)
                    case .failure(let error):
                        print(error)
                        self.delegate?.serviceResponseWithError(error:response.result.error!, serviceName:endPointMethodName)
                        
                    }
            }
            default:
            break
        }
    }
}

