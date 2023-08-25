//
//  BaseViewController.swift
//  Journey30
//
//  Created by Macbook 5 on 2/3/23.
//

import UIKit
import Stevia

class BaseViewController:UIViewController {
    
   
    
    var safeArea:UIEdgeInsets {
        return view.safeAreaInsets()
    }
    var didTapToolItem:((Bool) -> ())?
    let safeView:UIView = UIView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeView.backgroundColor = .clear
        
        view.subviews(safeView)
       
        if safeArea.bottom == 0 {
            safeView.height(20).fillHorizontally().bottom(0)
        } else {
            safeView.height(safeArea.bottom).fillHorizontally().bottom(0)
        }

        
        NotificationCenter.default
                    .addObserver(self,
                                 selector: #selector(statusManager),
                                 name: .flagsChanged,
                                 object: nil)
      
 
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appDidBecomeJustAcive),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        
    
        
        initKeypadObservers()
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressStop()
    }
    
   
    
    fileprivate
    func initKeypadObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }



    

    
    @objc
    private func appDidBecomeJustAcive(notification: Notification) {
        didBecomeActive(notification)
    }
  
 
    func progressStart(interaction:Bool = false) {
        ProgressHUD.show()
//        UIWindow.window()?.isUserInteractionEnabled = interaction
    }
    
    func progressStop() {
        ProgressHUD.dismiss()
//        UIWindow.window()?.isUserInteractionEnabled = true
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
    
    
    @objc
    private func statusManager(_ notification: Notification) {
        updateUserInterface()
    }

  
    
    /// Just subscribed or restore subscription
    /// - Parameter activate: subscription status
    func didSubscription(activate:Bool) {
        
    }
    
    /// called when device connected to internet or its reachable
    func networkReachable() {
        
    }
    
    /// called when device disconnected to internet or its unreachable
    func networkUnReachable() {
        
    }
    
    
    func didBecomeActive(_ notification:Notification) {
        
    }
    
    func didUpdateBookmarkHistory(date:Date?) {
        
    }
    
    func showHUD() {
        ProgressHUD.show()
    }
    
    func dismissHUD() {
        ProgressHUD.show()
    }
    
    func exapndSafeArea() {
        
    }
    
   
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        var h:CGFloat = 200
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            h = keyboardRectangle.height
        }
        keyboardMode(isActive: true, height: h)
    }
    
    @objc
    private func keyboardWillHide(notification: NSNotification) {
        keyboardMode(isActive: false, height: 0)
    }
    
    
    func keyboardMode(isActive:Bool,height:CGFloat) {
        
    }
    
   
}

