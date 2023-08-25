//
//  UITableViewCell+.swift
//  WritBot
//
//  Created by Macbook 5 on 2/13/23.
//

import UIKit

extension UITableViewCell {
    enum AnimateType {
        case simple
        case wave
        case leftToRight
        case rightToLeft
        case topToBottom
        case bottomToTop
        case rotation
        case linear
        case scaling
        case moveUpBounce
    }
    
    func animate(with animateType:AnimateType,indexPath:IndexPath) {
        switch animateType {
        case .simple:
            self.alpha = 0
                    
                UIView.animate(withDuration: 0.5, delay: 0.5*Double(indexPath.row),animations: {
                    self.alpha = 1
                })
        case .wave:
            self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y: 0)
                    UIView.animate(withDuration: 5, delay: 0.06*Double(indexPath.row), usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
                        self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y: self.contentView.frame.height)
                    })
        case .leftToRight:
            self.alpha = 0
                    self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y:self.contentView.frame.height)
                    UIView.animate(withDuration: 0.5, delay: 0.5*Double(indexPath.row), animations: {
                        self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y: self.contentView.frame.height)
                        self.alpha = 1
                    })
        case .rightToLeft:
            self.alpha = 0
                    self.transform = CGAffineTransform(translationX: 0, y:self.contentView.frame.height)
                    UIView.animate(withDuration: 0.5, delay: 0.5*Double(indexPath.row), animations: {
                        self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y: self.contentView.frame.height)
                        self.alpha = 1
                    })
        case .topToBottom:
            self.alpha = 0
                   self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y:0)
                   UIView.animate(withDuration: 0.5, delay: 0.5*Double(indexPath.row), animations: {
                       self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y: self.contentView.frame.height)
                       self.alpha = 1
                   })
        case .bottomToTop:
            self.alpha = 0
                    self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y:self.contentView.frame.height)
                    UIView.animate(withDuration: 0.5, delay: 0.5*Double(indexPath.row), animations: {
                        self.transform = CGAffineTransform(translationX: self.contentView.frame.width, y: 0)
                        self.alpha = 1
                    })
        case .rotation:
            self.alpha = 0
                   self.transform = CGAffineTransform(rotationAngle: 180)
                   UIView.animate(withDuration: 0.5, delay: 0.5*Double(indexPath.row), animations: {
                       self.transform = CGAffineTransform(rotationAngle: 0.0)
                       self.alpha = 1
                   })
        case .linear:
            self.transform =  CGAffineTransform(translationX: 0, y:0)
           
                  UIView.animate(withDuration: 1, delay: 0.05*Double(indexPath.row), options: .curveLinear) {
                      self.transform =  CGAffineTransform(translationX: self.contentView.frame.width, y: self.contentView.frame.height)
                  }
        case .scaling:
            self.transform = CGAffineTransform(scaleX: 0, y: 0)
                    UIView.animate(withDuration: 2, animations: {
                        self.transform = CGAffineTransform(scaleX: 1, y:1)
                    })
        case .moveUpBounce:
            self.alpha = 0
                    self.transform = CGAffineTransform(translationX: 0, y: self.contentView.frame.height)
             
                    UIView.animate(
                        withDuration: 0.25,
                        delay: 0.25 * Double(indexPath.row),
                        usingSpringWithDamping: 0.4,
                        initialSpringVelocity: 0.1,
                        options: [.curveEaseInOut],
                        animations: {
                            self.alpha = 1
                            self.transform = CGAffineTransform(translationX: 0, y: 0)
                    })
        }
    }
}

extension IndexPath {
    
    static var first:IndexPath {
        return IndexPath(row: 0, section: 0)
    }
}
