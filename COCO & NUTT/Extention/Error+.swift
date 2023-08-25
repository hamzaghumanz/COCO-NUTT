//
//  Error+.swift
//  WritBot
//
//  Created by Macbook 5 on 3/3/23.
//

import UIKit
extension Error {
    
    func showAlert(_ vc:UIViewController) {
        let nsError = self as NSError
        if nsError.code == 777 {
            let alert = UIAlertController(title: "Limit Exceeded", message: self.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            DispatchQueue.main.async {
                vc.present(alert, animated: true)
            }
        } else {
           
        }
    }
}
