//
//  LoginVC.swift
//  SIMS
//
//  Created by dilshad on 27/06/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var studentDetail = Dictionary<String,Any>()
    var loginModelArray: LoginModel?

    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldParentID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldParentID.text = "ADM0003"//"Gaurav"//"ADM0003"
        txtFldPassword.text = "9891547081"//"administrator"//"9891547081"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        guard let userId = txtFldParentID.text , userId != ""  else {
            return RBAlert.showWarningAlert(message: "Please enter user ID")
        }
        guard let password = txtFldPassword.text , password != ""  else {
            return RBAlert.showWarningAlert(message: "Please enter your password")
        }
        
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.logingIn.rawValue)
            
        }
        serviceHelper.delegate = self
                params["UserName"] = txtFldParentID.text
                params["Password"] = txtFldPassword.text
        serviceHelper.callWebService(endPointMethodName: .Service_ValidateUser, httpMethod: "POST", params: params)
     
    }
}

extension LoginVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
    self.view.hideLoader()
        }
        switch serviceName {
        case .Service_ValidateUser:
            let dataDict = response as!  NSArray
            print(dataDict)
            if (dataDict.count == 0) {
                
            RBAlert.showWarningAlert(message: "Record Not Found")
              
            }
            else{
                for data in dataDict{
                    studentDetail = data as! [String : Any]
                    loginModelArray = (LoginModel(dictionary: studentDetail))
                    
                    if loginModelArray?.UserGroupID == 1{
                    
    let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "AdminHomeVC") as! AdminHomeVC
    self.navigationController?.pushViewController(objRegister, animated: true)
                    }
                        
                else{
    let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        let branchId = loginModelArray?.BranchId
        UserDefaults.standard.set(branchId, forKey: "BranchId")
    self.navigationController?.pushViewController(objRegister, animated: true)
                    }
                }
            }
            
         default:
            print("ok")
        }
    }
}

