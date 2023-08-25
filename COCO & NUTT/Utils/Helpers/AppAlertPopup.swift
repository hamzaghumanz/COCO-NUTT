//
//  AppAlertPopup.swift
//  PenPilot
//
//  Created by Macbook 5 on 6/14/23.
//

import UIKit

class PopupViewController: UIViewController {
    private var messageLabel: UILabel!
    private var popupTimer: Timer?
    var popupDuration: TimeInterval = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        messageLabel = UILabel()
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 18.0)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.backgroundColor = .black
        messageLabel.layer.cornerRadius = 5
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func showMessage(_ message: String) {
        messageLabel.text = message
        popupTimer?.invalidate()
        popupTimer = Timer.scheduledTimer(timeInterval: popupDuration, target: self, selector: #selector(hidePopup), userInfo: nil, repeats: false)
    }
    
    @objc private func hidePopup() {
        dismiss(animated: true, completion: nil)
    }
}

