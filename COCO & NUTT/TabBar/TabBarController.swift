//
//  TabBarController.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 20/08/2023.
//

import UIKit

class TabBarController:UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
        self.tabBar.unselectedItemTintColor = .colorA9A9A9
        self.tabBar.tintColor = .colorC67C4E
        setUpTabbarControllers()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
    func setUpTabbarControllers()  {
        let homeController = HomeController()
        homeController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:  "tab-0")?.withRenderingMode(.alwaysTemplate), tag: 0)
        let home = BaseNavigationController(rootViewController: homeController)
        
        let likedController = LikedController()
        likedController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:  "tab-1")?.withRenderingMode(.alwaysTemplate), tag: 1)
        let liked = BaseNavigationController(rootViewController: likedController)
        
        let cartController = CartController()
        cartController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:  "tab-2")?.withRenderingMode(.alwaysTemplate), tag: 2)
        let cart = BaseNavigationController(rootViewController: cartController)
        
        let settingController = SettingController()
        settingController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:  "tab-3")?.withRenderingMode(.alwaysTemplate), tag: 3)
        let setting = BaseNavigationController(rootViewController: settingController)
        
        viewControllers = [home, liked,cart,setting]
        selectedViewController = home
        UserDefaults.standard.set(true, forKey: "OnboardingComplete")
    }
    
    
}


