//
//  BaseNavigationController.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 05/08/2023.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            navigationBarAppearance.backgroundColor = .clear
            navigationBarAppearance.shadowColor = .clear
            navigationBarAppearance.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont.poppinsSemiBold(ofSize: 26),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.poppinsMedium(ofSize: 20),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
            UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back-arrow")
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            navigationBar.tintColor = .black
            navigationBar.isHidden = true
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    
}
