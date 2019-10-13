//
//  Helper.swift
//  CablePlus
//
//  Created by Thinkbiz Solutions on 07/12/18.
//  Copyright © 2018 Thinkbiz Solutions. All rights reserved.
//


import UIKit
import RSLoadingView


class Helper: NSObject {
    

    class func setShadowonOn(_ viewshadow: UIView) {
        viewshadow.layer.shadowColor = UIColor(red: 226 / 255, green: 226 / 255, blue: 226 / 255, alpha: 0.5).cgColor
        viewshadow.layer.shadowOffset = CGSize(width: 0, height: 1)
        viewshadow.backgroundColor = UIColor .black
        viewshadow.layer.masksToBounds = true
        viewshadow.layer.cornerRadius = 5
    }
    
   
    
    class func isValidateEmail(strEmail:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: strEmail)
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
    
    
    
    
    class func imageToBase64(image: UIImage) -> String {
        let imageData = image.pngData()
        let base64String = imageData?.base64EncodedString(options: .lineLength64Characters)
        return base64String!
    }
    

struct Constant{
    static func GET_COLOR_RGB(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{
        return UIColor(red: 22/255.0, green: 37/255.0, blue: 89/255.0, alpha: 1.0)
    }
    
    static let APP_NAME = "Error"
    
}


class func  showLoader(view:UIView){
    DispatchQueue.main.async {
        let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView.sizeFactor = 0.4
        //loadingView.show(on: view)
        loadingView.showOnKeyWindow()
        Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(Helper.hideLoader(view:)), userInfo: nil, repeats: false)
    }
}

//MARK: Loader Methods
class func loader(view:UIView){
    DispatchQueue.main.async {
        let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView.sizeFactor = 0.4
        //loadingView.show(on: view)
        loadingView.showOnKeyWindow()
        Timer.scheduledTimer(timeInterval: 13, target: self, selector: #selector(Helper.hideLoader(view:)), userInfo: nil, repeats: false)
    }
}

@objc class func  loaderTimeOut(view:UIView){
    DispatchQueue.main.async {
        
        //RSLoadingView.hide(from: self.getTopView()!)
        
    }
}

@objc class func  hideLoader(view:UIView){
    DispatchQueue.main.async {
        //RSLoadingView.hide(from: view)
        RSLoadingView.hideFromKeyWindow()
    }
}


}

class Utilities: NSObject {
    //MARK: Loader Methods
    class func  showLoader(view:UIView){
        DispatchQueue.main.async {
            let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
            loadingView.sizeFactor = 0.4
            //loadingView.show(on: view)
            loadingView.showOnKeyWindow()
            Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(Utilities.hideLoader(view:)), userInfo: nil, repeats: false)
        }
    }
    
    //MARK: Loader Methods
    class func loader(view:UIView){
        DispatchQueue.main.async {
            let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
            loadingView.sizeFactor = 0.4
            //loadingView.show(on: view)
            loadingView.showOnKeyWindow()
            Timer.scheduledTimer(timeInterval: 13, target: self, selector: #selector(Utilities.hideLoader(view:)), userInfo: nil, repeats: false)
        }
    }
    
    @objc class func  loaderTimeOut(view:UIView){
        DispatchQueue.main.async {
            
            //RSLoadingView.hide(from: self.getTopView()!)
            
        }
    }
    
    @objc class func  hideLoader(view:UIView){
        DispatchQueue.main.async {
            //RSLoadingView.hide(from: view)
            RSLoadingView.hideFromKeyWindow()
        }
    }
    
    class func imageToBase64(image: UIImage) -> String {
        let imageData = image.pngData()
        let base64String = imageData?.base64EncodedString(options: .lineLength64Characters)
        return base64String!
    }
}
extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
    }
    
    var length: Int {
        return self.characters.count
    }
}
