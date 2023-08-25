//
//  BaseTableViewController.swift
//  WritBot
//
//  Created by Macbook 5 on 2/15/23.
//

import UIKit


class BaseTableViewController:UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default
                    .addObserver(self,
                                 selector: #selector(statusManager),
                                 name: .flagsChanged,
                                 object: nil)
    }
    

    func updateUserInterface() {
        switch Network.reachability.status {
        case .unreachable:
            networkUnReachable()
        case .wwan,.wifi:
            networkReachable()
        }
        print("Reachability Summary")
        print("Status:", Network.reachability.status)
        print("HostName:", Network.reachability.hostname ?? "nil")
        print("Reachable:", Network.reachability.isReachable)
        print("Wifi:", Network.reachability.isReachableViaWiFi)
    }
    
    
    @objc func statusManager(_ notification: Notification) {
        updateUserInterface()
    }

 
   

    func networkReachable() {
        
    }
    
    func networkUnReachable() {
        
    }
    
   
    func showHUD(_ title:String? = nil,interaction:Bool = true) {
//        UIWindow.window()?.isUserInteractionEnabled = interaction
        ProgressHUD.show(title)
    }
    
    func dismissHUD() {
//        UIWindow.window()?.isUserInteractionEnabled = true
        ProgressHUD.show(title)
    }
    
    
    
    func progressStart(_ title:String? = nil) {
        DispatchQueue.main.async {
            ProgressHUD.show(title)
        }
    }
    
    func progressStop() {
        ProgressHUD.dismiss()
    }
    
    
    
}
