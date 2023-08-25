//
//  UIViewController+.swift
//  Journey30
//
//  Created by Macbook 5 on 2/3/23.
//

import UIKit

extension UIViewController {
    
    func fullScreePresent(vc:UIViewController,presentFromRoot:Bool = false) {
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        if presentFromRoot {
            UIWindow.window()?.rootViewController?.present(vc, animated: true)
        } else {
            present(vc, animated: true)
        }
    }
    
    func showAlert(title:String?, message:String?,actionTitle:String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }

    
  
    func showSubscription() {
      
    }
    
    @objc
    func dismisModel() {
        ProgressHUD.dismiss()
        
        self.dismiss(animated: true)
    }
  
    func updatebookmarkHstry(date:Date?) {
//        let info:[String:Any] = [AppKeys.ideaDate:date as Any]
//        NotificationCenter.default.post(name: .didUpdateContent, object: nil,userInfo: info)
    }
    
    var isOnScreen: Bool{
        return self.isViewLoaded && view.window != nil
    }
}

