//
//  TeacherVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 13/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit
import ViewAnimator

class TeacherVC: UIViewController {
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var teacher = Dictionary<String,Any>()
    var teacherModelArray = [TeacherModel]()
    var branchId = String()
    @IBOutlet weak var lblFoundData: UILabel!
    @IBOutlet weak var tblViewTeacher: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    lblFoundData .isHidden = true
      // animate()
        subjectByTeacher()
    }
    func animate() {
        // Combined animations example
        let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
        let zoomAnimation = AnimationType.zoom(scale: 0.2)
        let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
        UIView.animate(views: tblViewTeacher.visibleCells,
                       animations: [zoomAnimation, rotateAnimation,fromAnimation],
                       duration: 0.5)
        
        
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
        params["ClassId"] = "2"
        params["SectionId"] = "1"

        
        serviceHelper.callWebService(endPointMethodName: .Service_SubjectByClassAndSectionId, httpMethod: "POST", params: params)
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension TeacherVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return teacherModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherCell
        let data = teacherModelArray[indexPath.row]
        cell.lblSubject.text = data.SubjectName

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "TeacherProfileVC") as! TeacherProfileVC
        self.navigationController?.pushViewController(objRegister, animated: true)
    }
}

extension TeacherVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_SubjectByClassAndSectionId:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                teacher = data as! [String : Any]
                teacherModelArray.append(TeacherModel.init(dictionary: teacher))
            }
            
            DispatchQueue.main.async {
                if self.teacherModelArray.count>0{
                    self.lblFoundData .isHidden = true
                }
                else{
                    self.lblFoundData .isHidden = false
                }
                self.tblViewTeacher.reloadData()
            }
        default:
            print("ok")
        }
    }
}

class TeacherCell: UITableViewCell {
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var viewBack: UIView!
}
