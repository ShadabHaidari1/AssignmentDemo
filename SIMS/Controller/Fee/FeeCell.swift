//
//  FeeCell.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 28/09/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class FeeCell: UITableViewCell {
    @IBOutlet weak var lblFee: UILabel!
    @IBOutlet weak var viewBackFee: UIView!
    
    @IBOutlet weak var lblClass: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblPaidAmount: UILabel!
    @IBOutlet weak var lblTotalFeel: UILabel!
    @IBOutlet weak var lblReceiptNo: UILabel!
    @IBOutlet weak var lblSection: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
