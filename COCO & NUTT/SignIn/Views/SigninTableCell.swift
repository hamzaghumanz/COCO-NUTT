//
//  SigninTableCell.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 05/08/2023.
//

import UIKit
import Stevia

class SigninTableCell:UITableViewCell {
    
    static let identifier = "SigninTableCell"
 
    private let signInLabel:UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .left
        label.font = .poppinsSemiBold(ofSize: 24)
        label.textColor = .colorFFFFFF
        return label
    }()
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor "
        label.textAlignment = .left
        label.font = .poppinsRegular(ofSize: 14)
        label.textColor = .colorBFBFBF
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var userNameView :BaseTextFieldView = {
        let view = BaseTextFieldView()
        view.titleLabel.text = "Username"
        view.textField.placeholder = "williamsmith"
        return view
    }()
    lazy var passwordView :BaseTextFieldView = {
        let view = BaseTextFieldView()
        view.titleLabel.text = "Password"
        view.textField.placeholder = "********"
        view.eyeIcon.image = UIImage(named: "icon_eye")
        return view
    }()
    
    lazy var logInButton:UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(UIColor.colorFFFFFF, for: .normal)
        button.titleLabel?.font = .poppinsSemiBold(ofSize: 16)
        button.layer.cornerRadius = 10
        button.backgroundColor = .colorC67C4E
        return button
    }()
    lazy var forgotButton:UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(UIColor.colorA9A9A9, for: .normal)
        button.titleLabel?.font = .poppinsRegular(ofSize: 14)
        return button
    }()
    lazy var resetButton:UIButton = {
        let button = UIButton()
        button.setTitle("Reset here", for: .normal)
        button.setTitleColor(UIColor.colorC67C4E, for: .normal)
        button.titleLabel?.font = .poppinsRegular(ofSize: 14)
        return button
    }()
    private var signUpButton:UIButton = {
        let button = UIButton()
        button.setTitle("Don’t have an account?", for: .normal)
        button.setTitleColor(UIColor.colorFFFFFF, for: .normal)
        button.titleLabel?.font = .poppinsRegular(ofSize: 14)
        return button
    }()
    lazy var createButton:UIButton = {
        let button = UIButton()
        button.setTitle("Create an account", for: .normal)
        button.setTitleColor(UIColor.colorFFFFFF, for: .normal)
        button.titleLabel?.font = .poppinsRegular(ofSize: 14)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectedBackgroundView = UIView()
        backgroundColor = .color0F0F0F
        subviews(signInLabel,titleLabel,userNameView,passwordView,logInButton,forgotButton,resetButton,signUpButton,createButton)

        signInLabel.width(82).height(36).left(0).top(0)
        titleLabel.width(318).height(46).left(0).Top == signInLabel.Bottom + 20
        userNameView.width(318).height(90).centerHorizontally().Top == titleLabel.Bottom + 40
        passwordView.width(318).height(90).centerHorizontally().Top == userNameView.Bottom + 20
        logInButton.width(318).height(52).centerHorizontally().Top == passwordView.Bottom + 40
        forgotButton.width(125).height(21).left(10).Top == logInButton.Bottom + 20
        resetButton.width(75).height(21).left(145).Top == logInButton.Bottom + 20
        signUpButton.width(167).height(22).centerHorizontally().Top == resetButton.Bottom + 40
        createButton.width(167).height(22).centerHorizontally().Top == signUpButton.Bottom + 40

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped(){
        
    }
}
