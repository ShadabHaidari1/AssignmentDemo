//
//  StratVC.swift
//  SIMS
//
//  Created by dilshad on 27/06/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class StratVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

  
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func btnRegisterNowTapped(_ sender: Any) {
        let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "UserTypeVC") as! UserTypeVC
        self.navigationController?.pushViewController(objRegister, animated: true)
      

    }
    
}
