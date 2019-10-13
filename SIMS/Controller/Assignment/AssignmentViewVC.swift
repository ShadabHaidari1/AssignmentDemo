//
//  AssignmentViewVC.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 26/09/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import UIKit

class AssignmentViewVC: UIViewController,UIWebViewDelegate {

   // var assignment = String()
    var assignment: String? = nil
    var isStart = false
    var isFinish = false

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(assignment ?? "")
      
        

    }
        
    override func viewWillAppear(_ animated: Bool) {
        guard let myString = assignment, !myString.isEmpty else {
          
            return RBAlert.showWarningAlert(message: "Result not found")
        }
        DispatchQueue.main.async {
            Helper.showLoader(view: self.view)
            self.isStart = true
            self.isFinish = true
       
            if let url = NSURL (string: imageURL + self.assignment! ){
                    print(url)
                    let requestObj = URLRequest(url: url as URL)
                    self.webView.loadRequest(requestObj)
                
            }
         
            
           
        }
    }
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

func webViewDidStartLoad(_ webView: UIWebView) {
    if isStart {
        
        DispatchQueue.main.async {
            
            Helper.showLoader(view: self.view)
            
        }
        isStart = false
    }
}
func webViewDidFinishLoad(_ webView: UIWebView) {
    if isFinish {
        
        Helper.hideLoader(view: self.view)
        
        isFinish = false
    }
}
}
