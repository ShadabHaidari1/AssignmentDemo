//
//  ContactusVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 15/09/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class ContactusVC: UIViewController {
    @IBOutlet weak var lblContactus: UILabel!
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var contact = Dictionary<String,Any>()
    var aboutModel: AboutusModel?
    var branchId = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        contactus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
   
    func contactus(){
        
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.subjects.rawValue)
            
        }
        if let branch = UserDefaults.standard.string(forKey: "BranchId"){
            branchId = branch
        }
        serviceHelper.delegate = self
        params["BranchId"] = branchId
        
        
        serviceHelper.callWebService(endPointMethodName: .Service_FetchAboutUs, httpMethod: "POST", params: params)
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ContactusVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_FetchAboutUs:
            let dataDict = response as!  NSArray
            for data in dataDict{
                contact = data as! [String : Any]
                
                aboutModel = AboutusModel(dictionary: contact)
                if let model = aboutModel {
                    updateUI(model: model)
                }
            }
            
        default:
            print("ok")
        }
    }
    
    func updateUI(model: AboutusModel)  {
        lblContactus.text = model.ContactNo
    }
}
