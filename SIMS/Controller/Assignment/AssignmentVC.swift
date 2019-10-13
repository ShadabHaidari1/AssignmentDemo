//
//  AssignmentVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 13/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class AssignmentVC: UIViewController {
    @IBOutlet weak var lblDataFound: UILabel!
    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnChecked: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var tlbViewAssignment: UITableView!
    var assign: Int = 0
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var assignment = Dictionary<String,Any>()
    var assignmentModelArray = [AssignmentModel]()
    var studentModelArray = [AssignmentStudentModel]()
    var checkModelArray = [AssignmentCheckedModel]()
    var branchId = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let branch = UserDefaults.standard.string(forKey: "BranchId"){
            branchId = branch
        }

        lblDataFound .isHidden = true
        lbl1.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.5843137255, blue: 0.8588235294, alpha: 1)
        uploadByTeacher()
      
    }
   
    func uploadByTeacher(){
        
        DispatchQueue.main.async {
      self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.assignments.rawValue)
        }
        serviceHelper.delegate = self
        params["BranchId"] = branchId
        params["StudentId"] = "4"
        serviceHelper.callWebService(endPointMethodName: .Service_AssignmentUploadByTeacher, httpMethod: "POST", params: params)
    }
    
    func submittedByStudent(){
        
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.assignments.rawValue)
        }
        serviceHelper.delegate = self
        params["BranchId"] = branchId
        params["StudentId"] = "4"
        serviceHelper.callWebService(endPointMethodName: .Service_AssignmentSubmittedByStudent, httpMethod: "POST", params: params)
    }
    
    func assignmentCheckedByTeacher(){
        
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.assignments.rawValue)
        }
        serviceHelper.delegate = self
        params["BranchId"] = branchId
        params["StudentId"] = "4"
        serviceHelper.callWebService(endPointMethodName: .Service_AssignmentCheckedByTeacher, httpMethod: "POST", params: params)
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnAllTabTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            assign = 0
            if (assignmentModelArray.count) >= 0 {
                tlbViewAssignment.dataSource = nil
                tlbViewAssignment.delegate = nil
                assignmentModelArray.removeAll()
            }
            uploadByTeacher()
            lbl1.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.5843137255, blue: 0.8588235294, alpha: 1)
            lbl2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lbl3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        case 1:
            assign = 1
            if (studentModelArray.count) >= 0 {
                tlbViewAssignment.dataSource = nil
                tlbViewAssignment.delegate = nil
                studentModelArray.removeAll()
            }
            submittedByStudent()
            lbl2.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.5843137255, blue: 0.8588235294, alpha: 1)
            lbl1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lbl3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        default:
            assign = 2
            if (checkModelArray.count) >= 0 {
                tlbViewAssignment.dataSource = nil
                tlbViewAssignment.delegate = nil
                checkModelArray.removeAll()
            }
            assignmentCheckedByTeacher()
            lbl3.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.5843137255, blue: 0.8588235294, alpha: 1)
            lbl2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lbl1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        tlbViewAssignment.reloadData()
    }
    
}

extension AssignmentVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if assign == 0{
            
            return UITableView.automaticDimension
        }
        else if assign == 1{
            return UITableView.automaticDimension
        }
        else{
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch assign {
        case 0:
            return assignmentModelArray.count
        case 1:
            return  studentModelArray.count
        default:
            return  checkModelArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if assign == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentCell") as! AssignmentCell
             let data = assignmentModelArray[indexPath.row]
          
            cell.lblAssignmentDate.text = "Assignment Date:  \(data.assignmentDate)"
            cell.lblSubmissionDate.text = "Submission Date:  \(data.assigmentSubmissionDate)"
            cell.lblDescription.text = "Description:  \(data.assignmentDescription)"
            cell.lblTeacherName.text = "Teacher Name:  \(data.teacherName)"
            cell.lblSubjectName.text = "Subject Name:  \(data.subjectName)"
            cell.lblAssignmentFile.text = "Assignment File: Tap on view" //\(data.assignmentFile)"
            
            return cell
        }
        else if  assign == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentCell2") as! AssignmentCell
            let data = studentModelArray[indexPath.row]
            cell.lblTeacherName.text = "Teacher Name:  \(data.teacherName)"
            cell.lblAssignmentDate.text = "Assignment Date:  \(data.assignmentDate)"
            cell.lblSubmissionDate.text = "Submission Date: \(data.assigmentSubmissionDate)"
            cell.lblSubjectName.text = "Subject Name:  \(data.subjectName)"
            cell.lblAssignmentFile.text = "Assignment File: \(data.assignmentFile)"
            cell.lblDescription.text = "Description:  \(data.assignmentDescription)"
            cell.lblSubmittedFile.text = "Submitted File:  Tap on view" //\(data.submitedFile)"
            cell.lblUloadStuDate.text = "Student Submitted Date:  \(data.uploadedByStudentDate)"
            cell.viewBackAssignment.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentCell3") as! AssignmentCell
            let data = checkModelArray[indexPath.row]
            cell.lblTeacherName.text = "Teacher Name:  \(data.teacherName)"
            cell.lblAssignmentDate.text = "Assignment Date:  \(data.assignmentDate)"
            cell.lblSubmissionDate.text = "Submission Date:  \(data.assigmentSubmissionDate)"
            cell.lblSubjectName.text = "Subject Name:  \(data.subjectName)"
            cell.lblAssignmentFile.text = "Assignment File: Tap on view" //\(data.assignmentFile)"
            cell.lblDescription.text = "Description:  \(data.assignmentDescription)"
            cell.lblRemarks.text = "Remarks:  \(data.checkedRemarks)"
            cell.lblCheckedDate.text = "Checked Date:  \(data.assignmentCheckedDate)"
            cell.lblUploadStuDate.text = "Upload Student Date:   \(data.uploadedByStudentDate)"
            
            
            cell.viewBackAssignment.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          if assign == 0{
            let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "AssignmentViewVC") as! AssignmentViewVC
             let data = assignmentModelArray[indexPath.row]
             let file = data.assignmentFile.removing(charactersOf: "~")
            objRegister.assignment = file
            self.navigationController?.pushViewController(objRegister, animated: true)
        }
          else if  assign == 1{
              let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "AssignmentViewVC") as! AssignmentViewVC
            let data = studentModelArray[indexPath.row]
            let file = data.submitedFile.removing(charactersOf: "~")
            print(file)
            objRegister.assignment = file
            self.navigationController?.pushViewController(objRegister, animated: true)
        }
          else{
              let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "AssignmentViewVC") as! AssignmentViewVC
            let data = checkModelArray[indexPath.row]
            let file = data.submitedFile.removing(charactersOf: "~")
            objRegister.assignment = file

            self.navigationController?.pushViewController(objRegister, animated: true)
            
        }
    }
}

extension AssignmentVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_AssignmentUploadByTeacher:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                assignment = data as! [String : Any]
                assignmentModelArray.append(AssignmentModel.init(dictionary: assignment))
            }
        case .Service_AssignmentSubmittedByStudent:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                assignment = data as! [String : Any]
                studentModelArray.append(AssignmentStudentModel.init(dictionary: assignment))
            }
        case .Service_AssignmentCheckedByTeacher:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                assignment = data as! [String : Any]
                checkModelArray.append(AssignmentCheckedModel.init(dictionary: assignment))
            }
           
        default:
            print("ok")
        }
        
        DispatchQueue.main.async {
            
            if self.assignmentModelArray.count>0 || self.studentModelArray.count>0 ||  self.checkModelArray.count>0 {
                self.tlbViewAssignment.dataSource = self
                self.tlbViewAssignment.delegate = self
                self.tlbViewAssignment.reloadData()
            }
            else{
                self.tlbViewAssignment.dataSource = self
                self.tlbViewAssignment.delegate = self
                self.lblDataFound .isHidden = false
                self.tlbViewAssignment.reloadData()
            }
        }
    }
}

class AssignmentCell: UITableViewCell {
    
    @IBOutlet weak var lblAssignmentDate: UILabel!
    @IBOutlet weak var viewBackAssignment: UIView!
    @IBOutlet weak var lblSubmissionDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblSubjectName: UILabel!
    @IBOutlet weak var lblTeacherName: UILabel!
    @IBOutlet weak var lblAssignmentFile: UILabel!
    @IBOutlet weak var lblUloadStuDate: UILabel!
    @IBOutlet weak var lblSubmittedFile: UILabel!
    @IBOutlet weak var lblCheckedDate: UILabel!
    @IBOutlet weak var lblRemarks: UILabel!
    @IBOutlet weak var lblUploadStuDate: UILabel!
    @IBOutlet weak var imgAssignment: UIImageView!
    
}
