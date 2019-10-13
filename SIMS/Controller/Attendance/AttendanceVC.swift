//
//  AttendanceVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 13/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class AttendanceVC: UIViewController,FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var attendance = Dictionary<String,Any>()
    var attendanceModelArray = [AttendanceModel]()
    var attendanceModelArrays: AttendanceModel?
    var presentDatesArray = [String]()
    var absentDatesArray = [String]()
    var storage = [String]()
    var branchId = String()
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy" //"dd.MM.yyyy"//16/09/2019
        return formatter
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attendanceStudent()
        
        
//        if let dates = formattedDateFromString(dateString: dateTime, withFormat: "dd/MM/yyyy"){
//            lblDateTime.text = dates + ", \(time)"
//        }
//        self.presentDatesArray = ["09/30/2019",
//                                  "11/30/2019",
//                                  "13/30/2019",
//                                  "15/30/2019"]
//
//
//        self.absentDatesArray = ["01/30/2019",
//                                 "03/30/2019",
//                                 "05/30/2019",
//                                 "07/30/2019"]
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func attendanceStudent(){
        
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.assignments.rawValue)
        }
        if let branch = UserDefaults.standard.string(forKey: "BranchId"){
            branchId = branch
        }
        serviceHelper.delegate = self
        params["BranchId"] = branchId
        params["StudentId"] = "1"
        serviceHelper.callWebService(endPointMethodName: .Service_StudentAttendance, httpMethod: "POST", params: params)
    }

    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        
        let dateString : String = dateFormatter1.string(from:date)
        
        if self.presentDatesArray.contains(dateString)
        {
            
            return UIColor.green
        }
            
        else if absentDatesArray.contains(dateString)
        {
            return UIColor.red
        }

        else{
            return nil
        }
    }
}


extension AttendanceVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_StudentAttendance:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                attendance = data as! [String : Any]
                 attendanceModelArrays = AttendanceModel(dictionary: attendance)
                print(attendanceModelArrays!)
            //    attendanceModelArrays.append(AttendanceModel.init(dictionary: attendance))
//                if let present = attendance["AttendanceDate"].flatMap({ $0 }){
//                    presentDatesArray = present as! [String]
//                }
            }
            
        default:
            print("ok")
        }
    }
}




func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
    
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"
    
    if let date = inputFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = format
        return outputFormatter.string(from: date)
    }
    return nil
}
