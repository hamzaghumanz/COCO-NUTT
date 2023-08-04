//
//  UIFont+.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 05/08/2023.
//

import UIKit

extension UIFont {
    
    class func poppinsRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Regular", size: size)!
    }
    class func poppinsMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Medium", size: size)!
    }
    class func poppinsSemiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-SemiBold", size: size)!
    }
    class func poppinsLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Light.ttf", size: size)!
    }
}
