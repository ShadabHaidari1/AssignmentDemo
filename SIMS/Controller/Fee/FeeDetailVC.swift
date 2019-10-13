//
//  FeeDetailVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 28/09/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class FeeDetailVC: UIViewController {

    @IBOutlet weak var lblFeeMonth: UILabel!
    @IBOutlet weak var tblViewFeeDetail: UITableView!
    
    var feeDetail: FeeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       lblFeeMonth.text = feeDetail?.MonthName
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension FeeDetailVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeeCell") as! FeeCell
        cell.lblClass.text = "Class : \(feeDetail?.ClassName ?? "")"
        cell.lblName.text = "Name : \(feeDetail?.StudentName ?? "")"
        cell.lblSection.text = "Section : \(feeDetail?.SectionName ?? "")"
        cell.lblReceiptNo.text = "Receipt No : \(feeDetail?.ReceiptNo ?? "")"
        cell.lblTotalFeel.text = "Total Amount : \(feeDetail?.TotalFee ?? 0)"
        cell.lblPaidAmount.text = "Paid Amount : \(feeDetail?.PaidAmount ?? 0)"
        return cell
        
    }
}
