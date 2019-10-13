//
//  HolidayVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 21/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class HolidayVC: UIViewController {

    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var holiday = Dictionary<String,Any>()
    var holidayModelArray = [HolidayModel]()

    @IBOutlet weak var tblViewHoliday: UITableView!
    @IBOutlet weak var lblDataFound: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblDataFound .isHidden = true
        holidayWebServices()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func holidayWebServices(){
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.holidays.rawValue)

        }

        serviceHelper.delegate = self
        serviceHelper.callWebService(endPointMethodName: .Service_Holiday, httpMethod: "GET", params: nil)
    }

    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension HolidayVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return holidayModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCell") as! HolidayCell
        let data = holidayModelArray[indexPath.row]
        cell.lblTitle.text = "Title: \(data.title)"
        cell.lblDetails.text = "Details: \(data.details)"
        cell.lblDate.text = "Date: \(data.fromDate)" + " to \(data.toDate)"
        return cell
    }
}

extension HolidayVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_Holiday:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                holiday = data as! [String : Any]
                holidayModelArray.append(HolidayModel.init(dictionary: holiday))
            }
            DispatchQueue.main.async {
                if self.holidayModelArray.count>0{
                    self.lblDataFound .isHidden = true
                }
                else{
                    self.lblDataFound .isHidden = false
                }
                self.tblViewHoliday.reloadData()
            }
            
        default:
            print("ok")
        }
    }
}

class HolidayCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var viewBackNotice: UIView!
}


