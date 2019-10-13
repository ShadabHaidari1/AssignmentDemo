//
//  ProgressBar.swift
//  SIMS
//
//  Created by Thinkbiz Solutions on 24/07/19.
//  Copyright © 2019 com.hosteller. All rights reserved.
//

import Foundation
import MBProgressHUD



// MARK: - UIView Extension
extension UIView {
    
    // - MARK: - Loading Progress View
    func showLoader(mainTitle title: String! = "", subTitle subtitle: String?) {
        
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud?.labelText = title
        hud?.detailsLabelText = subtitle
        hud?.isSquare = true
        hud?.mode = .indeterminate
        //hud.color = Colors.themeColor()
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: self, animated: true)
    }
    
    func hideAllLoadersForParticularView() {
        MBProgressHUD.hideAllHUDs(for: self, animated: true)
    }
    
    func showProgressLoader(subTitle subtitle: String?) -> MBProgressHUD {
        
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud?.labelText = ""
        hud?.detailsLabelText = subtitle
        hud?.isSquare = false
        hud?.mode = .determinateHorizontalBar
        return hud!
    }
    
}


//MARK: - Signup -
enum SignUpIdentifier {
    
    enum imageTitle: String {
        case revolutionLogo = "revolutionBuyLogo"
        case avatar = "avatarIcon"
    }
    
    enum title: String {
        case agePermission = "Are you over 18? This is legally required to use the app."
        case agePermissionDenied = "Sorry, you must be over 18 to use this app."
        case addPhoto = "Add Photo"
        case editPhoto = "Edit Photo"
        case gotIt = "Got It"
    }
    
    enum UserRegistrationType: Int {
        case email = 0, facebook
    }
    
    enum identifier: String {
        case signingUp = "Signing up"
        case logingIn = "Signing in"
        case assignments = "Assignment"
        case holidays = "Holiday"
        case events = "Event"
        case notices = "Notice"
        case subjects = "Subject"
        case profile = "Profile"
        case updatingProfile = "Updating\nProfile"
    }
    
    enum alert: String {
        case enterEmail = "Please enter your email address"
        case enterValidEmail = "Please enter a valid email address"
        case enterPassword = "Please enter password"
        case passwordLength = "Password must be between 5 to 15 characters long"
        case enterFullName = "Please enter your Full Name"
        case enterCorrectFullName = "Only alphabets and spaces are allowed in Full Name"
        case enterAge = "Please enter your age"
        case invalidAge = "You must be 18 years or older to use this app."
        case selectCountry = "Please select your country"
        case selectState = "Please select your state"
        case selectCity = "Please select your city"
        case profileImage = "Please select your profile image"
        case enterMobile = "Please enter your mobile number"
        case enterValidMobile = "Mobile number must start with '+' and country code"
        case enterPin = "Please enter a valid PIN"
        case verifyEmail = "An email has been sent for verification. Please verify your email to login.\nIf you do not find the email in your inbox, please check your spam filter or bulk email folder."
        case unverifiedUser = "You haven't verified email yet. Please verify your email to login."
        case profileSetUp = "Your profile has been set up"
        case currentPassword = "Please enter current password"
        case enterNewPassword = "Please enter new password"
        case enterConfirmPassword = "Please enter confirm password"
        case passwordUnmatched = "New password and confirm password did not match"
    }
}
