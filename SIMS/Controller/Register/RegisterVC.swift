//
//  RegisterVC.swift
//  SIMS
//
//  Created by dilshad on 27/06/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnRegisterTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
