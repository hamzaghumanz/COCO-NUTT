//
//  BaseNavigationController.swift
//  StellarScope
//
//  Created by Macbook 5 on 7/17/23.
//


import UIKit

class BaseNavigationController:UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initBar()
    }
    
    func initBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground() // Use this method to set a clear background
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.backgroundImage = UIImage()
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.poppinsSemiBold(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.poppinsSemiBold(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        // Set the navigation bar appearance for different states
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
    }

  
}

