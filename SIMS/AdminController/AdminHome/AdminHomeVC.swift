//
//  AdminHomeVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 08/10/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class AdminHomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnAllTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("Zero")
        case 1:
            print("One")
        case 2:
            print("Two")
        default:
            print("Three")

        }
    }
}
