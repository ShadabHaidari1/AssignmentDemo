//
//  CustomAlert.swift
//  GoldenGarageTyres
//
//  Created by Thinkbiz Solutions on 05/09/19.
//  Copyright © 2019 Thinkbiz Solutions. All rights reserved.
//

import Foundation

class CustomAlert: NSObject {
    
    
    class func setShadowonOn(_ viewshadow: UIView) {
        viewshadow.layer.shadowColor = UIColor(red: 226 / 255, green: 226 / 255, blue: 226 / 255, alpha: 0.5).cgColor
        viewshadow.layer.shadowOffset = CGSize(width: 0, height: 1)
        viewshadow.backgroundColor = UIColor .white
        viewshadow.layer.masksToBounds = true
        viewshadow.layer.cornerRadius = 5
    }
    
    
    
    
    
    class func showAsAlert(strMessage:String,VC:UIViewController){
        let alert = UIAlertController(title: Constant.APP_NAME, message: strMessage, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert .addAction(ok)
        VC.present(alert, animated: true, completion: nil)
    }
    class func setAlertUIWithBlurrView(viewPopup:UIView){
        viewPopup.frame = (UIApplication .shared .keyWindow?.bounds)!
        UIApplication .shared .keyWindow?.addSubview(viewPopup)
        viewPopup.backgroundColor = UIColor(white: 0.0, alpha: 0.7)
    }
    class func setButtonImageWithTintColor(btn:UIButton,strImageName:String,tintColor:UIColor) {
        let image = UIImage(named: strImageName)?.withRenderingMode(.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.tintColor = tintColor
    }
    class func showCustomAlertVC(VC:UIViewController,sender:UIButton){
        VC.modalPresentationStyle = .overCurrentContext
        VC.modalTransitionStyle = .crossDissolve
        VC.preferredContentSize = CGSize(width: 300, height: 300)
        let pVC = VC.popoverPresentationController
        pVC?.permittedArrowDirections = .any
        pVC?.sourceView = sender
        pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
    }
    
    
    
    
   
    
    
    struct Constant{
        static func GET_COLOR_RGB(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{
            return UIColor(red: 22/255.0, green: 37/255.0, blue: 89/255.0, alpha: 1.0)
        }
        
        static let APP_NAME = "Error"
        
    }
    
    
}
