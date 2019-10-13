//
//  EventVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 24/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class EventVC: UIViewController {

    @IBOutlet weak var tblViewEvent: UITableView!
    @IBOutlet weak var lblDataFound: UILabel!
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var event = Dictionary<String,Any>()
    var eventModelArray = [EventModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
     lblDataFound .isHidden = true
     eventWebServices()
    }
    func eventWebServices(){
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.events.rawValue)

        }

        serviceHelper.delegate = self
        serviceHelper.callWebService(endPointMethodName: .Service_Event
            , httpMethod: "GET", params: nil)
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension EventVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return eventModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        let data = eventModelArray[indexPath.row]
        cell.lblTitle.text = "Title: \(data.title)"
        cell.lblDetails.text = "Details: \(data.details)"
        cell.lblDate.text = "Date: \(data.fromDate)" + " to \(data.toDate)"
        return cell
    }
}


extension EventVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
          self.view.hideLoader()
        }
        switch serviceName {
        case .Service_Event:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                event = data as! [String : Any]
                eventModelArray.append(EventModel.init(dictionary: event))
            }
            DispatchQueue.main.async {
                if self.eventModelArray.count>0{
                    self.lblDataFound .isHidden = true
                }
                else{
                    self.lblDataFound .isHidden = false
                }
                self.tblViewEvent.reloadData()
            }
            
        default:
            print("ok")
        }
    }
}

class EventCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var viewBackNotice: UIView!
}
