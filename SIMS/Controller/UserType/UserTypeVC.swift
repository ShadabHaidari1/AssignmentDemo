//
//  UserTypeVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 10/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class UserTypeVC: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnParentLoginTapped(_ sender: Any) {
        

        let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(objRegister, animated: true)
    }
    
    @IBAction func btnAdminLoginTapped(_ sender: Any) {
    }
}

