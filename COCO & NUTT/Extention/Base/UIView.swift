//
//  UIView.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 05/08/2023.
//

import UIKit

extension UIView {
    
    
    func gradientEffect(colors:[CGColor],cornerRadius:CGFloat? = nil) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
        if let isCorner = cornerRadius {
            layer.cornerRadius = isCorner
        }
        layer.insertSublayer(gradient, at: 0)
    }
}
