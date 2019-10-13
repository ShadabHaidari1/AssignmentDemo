//
//  SideMenuVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 29/06/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var tblViewSideMenu: UITableView!
    var newFrontViewController: UINavigationController?
    var sideCategories = ["About Us",
                          "Contact Us",
                          "Holiday",
                          "Event",
                          "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

  

}

extension SideMenuVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return sideCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
        
        cell.lblSideMenu.text = sideCategories[indexPath.row]

        return cell
    }
    
    func initiliazeNavigation() {
        
        let mainStoryBoard = UIStoryboard(name: "Main" ,bundle:nil)
        let desController = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        newFrontViewController = UINavigationController.init(rootViewController:desController)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewControllor:SWRevealViewController = self.revealViewController()
        
        let cell:SideMenuCell = tableView.cellForRow(at: indexPath)as! SideMenuCell
        if cell.lblSideMenu.text! == "About Us"
        {
            let mainStoryBoard = UIStoryboard(name: "Main" ,bundle:nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "AboutusVC") as! AboutusVC
            
            if newFrontViewController == nil {
                initiliazeNavigation()
            }
            newFrontViewController?.pushViewController(desController, animated: false)
            revealViewControllor.pushFrontViewController(newFrontViewController, animated: true)
            
        }
        if cell.lblSideMenu.text! == "Holiday"
        {
            let mainStoryBoard = UIStoryboard(name: "Main" ,bundle:nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "HolidayVC") as! HolidayVC
            
            if newFrontViewController == nil {
                initiliazeNavigation()
            }
            newFrontViewController?.pushViewController(desController, animated: false)
            revealViewControllor.pushFrontViewController(newFrontViewController, animated: true)
            
        }
        if cell.lblSideMenu.text! == "Event"
        {
            let mainStoryBoard = UIStoryboard(name: "Main" ,bundle:nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "EventVC") as! EventVC
            
            if newFrontViewController == nil {
                initiliazeNavigation()
            }
            newFrontViewController?.pushViewController(desController, animated: false)
            revealViewControllor.pushFrontViewController(newFrontViewController, animated: true)
            
        }
        if cell.lblSideMenu.text! == "Contact Us"
        {
            let mainStoryBoard = UIStoryboard(name: "Main" ,bundle:nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "ContactusVC") as! ContactusVC
            
            if newFrontViewController == nil {
                initiliazeNavigation()
            }
            newFrontViewController?.pushViewController(desController, animated: false)
            revealViewControllor.pushFrontViewController(newFrontViewController, animated: true)
            
        }
        
        if cell.lblSideMenu.text! == "Logout"
        {
            let mainStoryBoard = UIStoryboard(name: "Main" ,bundle:nil)
         //   UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//            UserDefaults.standard.removeObject(forKey: "user_id")
//            UserDefaults.standard.removeObject(forKey: "user_name")
//            UserDefaults.standard.removeObject(forKey: "user_email")
//            UserDefaults.standard.synchronize()
            if newFrontViewController == nil {
                initiliazeNavigation()
            }
            newFrontViewController?.pushViewController(desController, animated: false)
            revealViewControllor.pushFrontViewController(newFrontViewController, animated: true)
            
        }
        
        
    }
    
}

class SideMenuCell: UITableViewCell {
    @IBOutlet weak var lblSideMenu: UILabel!
   
}
