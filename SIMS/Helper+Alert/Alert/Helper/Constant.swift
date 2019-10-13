//
//  Constant.swift
//  CustomAlert
//
//  Created by Thinkbiz Solutions on 22/05/19.
//  Copyright © 2019 Thinkbiz Solutions. All rights reserved.
//

import Foundation
import UIKit


//let UserDefaults = Foundation.UserDefaults.standard
struct Constants {
    
   
    
    static let DEFAULT_SCREEN_RATIO: CGFloat = 375.0
    static let KSCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
    static let KSCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
    
    struct ScreenSize {
        static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        
    }
    
    static let KSCREEN_WIDTH_RATIO: CGFloat = UIScreen.main.bounds.size.width / 375.0
    static let KSCREEN_HEIGHT_RATIO: CGFloat = UIScreen.main.bounds.size.height / 667.0
    
  
    
    struct color {
        //Onboarding
        static let onboardingTitleColor: UIColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.87)
        
        //Button corner radius
        static let buttonCornerRadiusColor: UIColor = UIColor.init(red: 31.0 / 255.0, green: 89.0 / 255.0, blue: 156.0 / 255.0, alpha: 1.0)
        
        // Theme blue color
        static let themeBlueColor: UIColor = UIColor.init(red: 31.0 / 255.0, green: 89.0 / 255.0, blue: 156.0 / 255.0, alpha: 1.0)
        static let themeDarkYellowColor: UIColor = UIColor.init(red: 207.0 / 255.0, green: 166.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0)
        
        //Textfield text color
        static let textFieldTextColor: UIColor = UIColor.init(red: 35.0 / 255.0, green: 66.0 / 255.0, blue: 112.0 / 255.0, alpha: 0.87)
        static let textFieldPlaceholderColor: UIColor = UIColor.init(red: 128.0 / 255.0, green: 149.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0)
        static let textFieldBorderDefaultColor: UIColor = UIColor.init(red: 224.0 / 255.0, green: 224.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        static let textFieldBorderWarningColor: UIColor = UIColor.init(red: 208.0 / 255.0, green: 1.0 / 255.0, blue: 27.0 / 255.0, alpha: 1.0)
        static let textFieldImageBackColor: UIColor = UIColor.init(red: 246.0 / 255.0, green: 250.0 / 255.0, blue: 1.0, alpha: 1.0)
        static let textFieldBorderFilledColor: UIColor = UIColor.init(red: 31.0 / 255.0, green: 89.0 / 255.0, blue: 156.0 / 255.0, alpha: 1.0)
        
        //Blur view color
        static let topBlurColor: UIColor = UIColor.init(red: 226.0 / 255.0, green: 226.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
        
        static let borderColorTextview: UIColor = UIColor.init(red: 224.0 / 255.0, green: 224.0 / 255.0, blue: 224.0 / 255.0, alpha: 0.5)
        
        static let placeholderTextView: UIColor = UIColor.init(red: 128.0 / 255.0, green: 149.0 / 255.0, blue: 172.0 / 255.0, alpha: 0.5)
        
        //Add image
        static let borderGreyColor: UIColor = UIColor.init(red: 176.0 / 255.0, green: 176.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0)
        
        //UIlabel Active/Inactive
        static let labelActiveColor: UIColor = UIColor.init(red: 31.0 / 255.0, green: 89.0 / 255.0, blue: 156.0 / 255.0, alpha: 1.0)
        static let labelInActiveTextColor: UIColor = UIColor.init(red: 176.0 / 255.0, green: 176.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0)
        
        //Profile view components border color
        static let viewProfileComponentBorderColor: UIColor = UIColor.init(red: 176.0 / 255.0, green: 176.0 / 255.0, blue: 176.0 / 255.0, alpha: 50.0)
        
        //Notification read unread color
        static let notificationReadColor: UIColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        static let notificationUnReadColor: UIColor = UIColor.init(red: 239.0 / 255.0, green: 243.0 / 255.0, blue: 1.0, alpha: 1.0)
        
        //Seller Product status
        static let soldTextColor: UIColor = UIColor.init(red: 32.0 / 255.0, green: 152.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
        static let soldBackColor: UIColor = UIColor.init(red: 238.0 / 255.0, green: 251.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
        
        static let offerSentTextColor: UIColor = buttonCornerRadiusColor
        static let offerSentBackColor: UIColor = notificationUnReadColor
    }
    
    enum Segue: String {
        case kSegueToSelectCategory = "SegueToSelectCategory"
        case kSegueFromSelectCategoryToAddTitle = "SegueFromSelectCategoryToAddTitle"
        case kSegueFromAddTitleToAddDescription = "SegueFromAddTitleToAddDescription"
        case kSegueFromAddDescriptionToAddPictures = "SegueFromAddDescriptionToAddPictures"
    }
    
    enum NotificationsIdentifier: String {
        case kNotificationItemPurchasedByBuyer = "NotificationItemPurchasedByBuyer"
        case kNotificationItemSoldBySeller = "NotificationItemSoldBySeller"
        case kNotificationItemSoldByBuyerPushNotified = "NotificationItemPurchasedByBuyerPushNotified"
    }
    
    enum NotificationsObjectIdentifier: String {
        case kWishlistItem = "NotificationsObjectIdentifierWishlistItem"
        case kOfferItem = "NotificationsObjectIdentifierOfferItem"
    }
}




