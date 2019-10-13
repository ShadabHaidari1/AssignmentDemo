//
//  ProfileVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 11/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var lblStuName: UILabel!
    @IBOutlet weak var lblClass: UILabel!
    @IBOutlet weak var lblSection: UILabel!
    @IBOutlet weak var lblRollNo: UILabel!
    @IBOutlet weak var lblMobileNo: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAdhaarNo: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblAdmissionNo: UILabel!
    @IBOutlet weak var imgProfilePic: UIImageView!
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var studentDetail = Dictionary<String,Any>()
    var profileModelArray = [ProfileModel]()
    var branchId = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       studentProfileInfo()
    }
    
    func studentProfileInfo(){
        
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.profile.rawValue)
        }
        serviceHelper.delegate = self
        if let branch = UserDefaults.standard.string(forKey: "BranchId"){
            branchId = branch
        }
        params["BranchId"] = branchId
        params["StudentId"] = "4"
        serviceHelper.callWebService(endPointMethodName: .Service_StudentDetailsById, httpMethod: "POST", params: params)
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension ProfileVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_StudentDetailsById:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                studentDetail = data as! [String : Any]
              
                lblStuName.text = studentDetail["StudentName"] as? String
                lblAdhaarNo.text = studentDetail["AdhaarNo"] as? String
                lblAddress.text = studentDetail["Address"] as? String
                lblAdmissionNo.text = studentDetail["AdmissionNo"] as? String
                lblClass.text = studentDetail["ClassName"] as? String
                lblEmail.text = studentDetail["EmailID"] as? String
                lblMobileNo.text = studentDetail["MobileNo"] as? String
                lblRollNo.text = studentDetail["RollNo"] as? String
                lblSection.text = studentDetail["SectionName"] as? String
                lblAdmissionNo.text = studentDetail["AdmissionNo"] as? String
             
                if let profile = studentDetail["StudentImageUrl"] as? String{
                    let imageUrl = imageURL + "\(String(describing: profile.removing(charactersOf: "~")))"
                    imgProfilePic.sd_setImage(with: URL(string: imageUrl ), placeholderImage: UIImage(named:"PlaceHolder"))
                }
            }
            
        default:
            print("ok")
        }
        
    }
}
extension String {
    func removing(charactersOf string: String) -> String {
        let characterSet = CharacterSet(charactersIn: string)
        let components = self.components(separatedBy: characterSet)
        return components.joined(separator: "")
}
}
