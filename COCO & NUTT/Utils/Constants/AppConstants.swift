//
//  AppConstants.swift
//  AudioNotes
//
//  Created by Macbook 5 on 8/24/23.
//


import Foundation
import UIKit

var isBuyProVersion = false
class AppConstants {
    
 

//    static var windowWidth:CGFloat? = UIWindow.window()?.frame.width
  
    static let displayName = Bundle.main.displayName ?? ""
 
  
    
    
    static var isDateRange = false
    static var isCategory = false
  
    static let appURL                = ""
    static let subsURL               = ""
    static let feedbackAddress       = "@gmail.com"
    static let termsURL              = ""
    static let privacyURL            = ""
    static let termsSubscription     = ""

    static let appShareText          = "\(displayName), Fast and efficient document scanner in the world."
    static let disconnectDesc        = "You are currently offline."
    static let connectedDesc         = "Your internet connection was restored."

    static var isLeft  = true
    static var cellWidth:CGFloat?
    
    static var contentOffset:CGPoint = .zero
    static var tabBarHeight:CGFloat = .zero
}



extension Notification.Name {
 
    static let didActive        = Notification.Name("didActive")
    static let flagsChanged     = Notification.Name("FlagsChanged")
 
}
extension Bundle {
    
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}

