//
//  BaseTabbarController.swift
//  StellarScope
//
//  Created by Macbook 5 on 7/18/23.
//

import UIKit


class DashboardController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        let tabBarHeight: CGFloat = 100
//        tabBar.frame.size.height  = tabBarHeight
//        let firstVC = HomeController()
//        firstVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-0-u")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab-0-s")?.withRenderingMode(.alwaysOriginal))
//
//        let secondVC = UIViewController()
//        secondVC.tabBarItem = UITabBarItem(title: nil, image:UIImage(named: "tab-1-u")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab-1-s")?.withRenderingMode(.alwaysOriginal))
//
//        let thirdVC = BaseNavigationController(rootViewController: ExcerciseController())
//        thirdVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-2-u")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab-2-s")?.withRenderingMode(.alwaysOriginal))
//
//        let fourthVC = UIViewController()
//        fourthVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-3-u")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab-3-s")?.withRenderingMode(.alwaysOriginal))
//
//        tabBar.backgroundColor = .color0A0A24
//        viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        if let viewControllers = viewControllers {
//               for viewController in viewControllers {
//                   let tabBarItem = viewController.tabBarItem
//                   tabBarItem?.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -(isSmallDevice ? -5 : 10), right: 0)
//                   tabBarItem?.image = tabBarItem?.image?.withRenderingMode(.alwaysOriginal)
//               }
//        }
    }
}
