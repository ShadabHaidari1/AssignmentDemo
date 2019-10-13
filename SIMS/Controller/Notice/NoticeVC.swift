//
//  NoticeVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 13/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController {
    @IBOutlet weak var lblRecordFound: UILabel!
    
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var notice = Dictionary<String,Any>()
    var noticeModelArray = [NoticeModel]()

    
    @IBOutlet weak var tblViewNotice: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblRecordFound .isHidden = true

        noticeWebServices()
    }
    
    func noticeWebServices(){
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.notices.rawValue)

        }

        serviceHelper.delegate = self
        serviceHelper.callWebService(endPointMethodName: .Service_Notice, httpMethod: "GET", params: nil)
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   

}

extension NoticeVC : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80.0
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return noticeModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell") as! NoticeCell
        let data = noticeModelArray[indexPath.row]
        cell.lblMessage.text = data.message
        cell.lblSubject.text = data.subject
        return cell
    }
}


extension NoticeVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_Notice:
            let dataDict = response as!  NSArray
            print(dataDict)
            for data in dataDict{
                notice = data as! [String : Any]
                noticeModelArray.append(NoticeModel.init(dictionary: notice))
            }
            
            DispatchQueue.main.async {
                if self.noticeModelArray.count>0{
                    self.lblRecordFound .isHidden = true
                }
                else{
                    
                    self.lblRecordFound .isHidden = false
                }
                self.tblViewNotice.reloadData()
            }
            
        default:
            print("ok")
        }
    }
}



class NoticeCell: UITableViewCell {
    
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var viewBackNotice: UIView!
}
