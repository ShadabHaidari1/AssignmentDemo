//
//  AboutusVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 14/09/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class AboutusVC: UIViewController {
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var about = Dictionary<String,Any>()
    var aboutModel: AboutusModel?
    var branchId = String()
    @IBOutlet weak var lblAboutus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       aboutus()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    func aboutus(){
        
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

extension AboutusVC: ServiceHelperDelegate {
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
                about = data as! [String : Any]
                
                aboutModel = AboutusModel(dictionary: about)
                if let model = aboutModel {
                    updateUI(model: model)
                }
            }
            
            
        default:
            print("ok")
        }
    }
    
    func updateUI(model: AboutusModel)  {
        lblAboutus.text = model.AboutUs
    }
}
