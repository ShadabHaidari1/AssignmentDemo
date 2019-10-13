//
//  TeacherProfileVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 13/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit
import MessageUI
class TeacherProfileVC: UIViewController,MFMailComposeViewControllerDelegate {
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var teacher = Dictionary<String,Any>()
    var teacherModel: TeacherProfileModel?
    var mobile = String()
    var email = String()
    var branchId = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        subjectByTeacher()
    }
    
    func subjectByTeacher(){
        
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.subjects.rawValue)
            
        }
        if let branch = UserDefaults.standard.string(forKey: "BranchId"){
            branchId = branch
        }

        serviceHelper.delegate = self
        params["BranchId"] = branchId
        params["StudentId"] = "4"
        
        
        serviceHelper.callWebService(endPointMethodName: .Service_TeacherWithSubject, httpMethod: "POST", params: params)
    }

   
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func whatsApp(){
       
            let urlWhats = "+91 \(mobile)"
            if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
                if let whatsappURL = URL(string: urlString) {
                    if UIApplication.shared.canOpenURL(whatsappURL){
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(whatsappURL)
                        }
                    }
                    else {
                        print("Install Whatsapp")
                    }
                }
            }
        }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
   
    func makeAPhoneCall()  {
        
        
        let url: NSURL = URL(string: mobile)! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        print("Ok")
    }

    @IBAction func btnContactDetailTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            whatsApp()
        case 1:
            sendEmail()
        default:
           makeAPhoneCall()
        }
    }
}

extension TeacherProfileVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_TeacherWithSubject:
            let dataDict = response as!  NSArray
            for data in dataDict{
                teacher = data as! [String : Any]
                
                teacherModel = TeacherProfileModel(dictionary: teacher)
                if let model = teacherModel {
                   updateUI(model: model)
                }
            }

        default:
            print("ok")
        }
    }
    
    func updateUI(model: TeacherProfileModel)  {
        lblName.text = model.EmployeeName
        lblEmail.text = "Email : \(model.EmailId ?? "")"
        lblContact.text = "Mobile : \(model.Mobile ?? "")"
        mobile = model.Mobile ?? ""
        email = model.EmailId ?? ""
        
        if let profile = model.Image{
            let imageUrl = imageURL + profile.removing(charactersOf: "~")
            imgProfilePic.sd_setImage(with: URL(string: imageUrl ), placeholderImage: UIImage(named:"PlaceHolder"))
        }
    }
}
