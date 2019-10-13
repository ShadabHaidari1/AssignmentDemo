//
//  HomeVC.swift
//  SIMS
//
//  Created by dilshad on 27/06/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    
    override func viewWillAppear(_ animated: Bool) {
       
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    ////////////////// MARK: - Button Navigation Side Menu ////////////////////
    
    @IBAction func btnNavigationTapped(_ sender: Any) {
        if self.revealViewController() != nil {
            self.revealViewController().revealToggle(sender)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
    }
    ////////////////// MARK: - Device Size Validation //////////////////////////
    
    @IBAction func btnAllMenuTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
        let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(objRegister, animated: true)

        case 1:
            let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "FeeVC") as! FeeVC
            self.navigationController?.pushViewController(objRegister, animated: true)
        case 2:
            let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "AssignmentVC") as! AssignmentVC
            self.navigationController?.pushViewController(objRegister, animated: true)
        case 3:
            let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "TeacherVC") as! TeacherVC
            self.navigationController?.pushViewController(objRegister, animated: true)

        case 4:
            let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "AttendanceVC") as! AttendanceVC
            self.navigationController?.pushViewController(objRegister, animated: true)

            
        default:
            let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "NoticeVC") as! NoticeVC
            self.navigationController?.pushViewController(objRegister, animated: true)

        }
    }
}
