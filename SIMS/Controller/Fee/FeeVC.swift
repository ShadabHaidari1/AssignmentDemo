//
//  FeeVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 13/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class FeeVC: UIViewController {
    let serviceHelper = ServiceHelper()
    var params = Dictionary<String,Any>()
    var feeModelArray = [FeeModel]()
    var branchId = String()
     var fee = Dictionary<String,Any>()
    @IBOutlet weak var tblViewFee: UITableView!
    @IBOutlet weak var lblFoundData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblFoundData .isHidden = true
        feePayment()
    }
    
    func feePayment(){
        
        DispatchQueue.main.async {
            self.view.showLoader(mainTitle: "", subTitle: SignUpIdentifier.identifier.subjects.rawValue)
            
        }
        if let branch = UserDefaults.standard.string(forKey: "BranchId"){
            branchId = branch
        }
        serviceHelper.delegate = self
        params["BranchId"] = branchId
        params["StudentId"] = "4"
        
        
        serviceHelper.callWebService(endPointMethodName: .Service_FeePaymentByStudent, httpMethod: "POST", params: params)
    }

    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}

extension FeeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return feeModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeeCell") as! FeeCell
        let data = feeModelArray[indexPath.row]
        cell.lblFee.text = data.MonthName
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "FeeDetailVC") as! FeeDetailVC
        let data = feeModelArray[indexPath.row]
        objRegister.feeDetail = data
        self.navigationController?.pushViewController(objRegister, animated: true)

    }
}

extension FeeVC: ServiceHelperDelegate {
    func serviceResponseWithError(error: Error, serviceName: ServiceMethod) {
        print("error in vc",error)
    }
    
    func serviceResponseWithSuccess(response: Any, serviceName: ServiceMethod) {
        
        DispatchQueue.main.async {
            self.view.hideLoader()
        }
        switch serviceName {
        case .Service_FeePaymentByStudent:
            let dataDict = response as!  NSArray
            for data in dataDict{
                fee = data as! [String : Any]
                feeModelArray.append(FeeModel.init(dictionary: fee))
            }

            DispatchQueue.main.async {
                if self.feeModelArray.count>0{
                    self.lblFoundData .isHidden = true
                }
                else{
                    self.lblFoundData .isHidden = false
                }
                self.tblViewFee.reloadData()
            }
        default:
            print("ok")
        }
    }
}
