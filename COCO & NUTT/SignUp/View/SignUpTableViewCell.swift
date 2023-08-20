//
//  SignUpTableView.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 06/08/2023.
//

import UIKit
import Stevia

class SignUpTableViewCell:UITableViewCell {
    
    static let identifier = "SignUpTableViewCell"
 
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Create an account"
        label.textAlignment = .left
        label.font = .poppinsSemiBold(ofSize: 24)
        label.textColor = .colorFFFFFF
        return label
    }()
    private let subTitleLabel:UILabel = {
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
    
    lazy var emailView :BaseTextFieldView = {
        let view = BaseTextFieldView()
        view.titleLabel.text = "Email"
        view.textField.placeholder = "williamsmithy@mail.com"
        return view
    }()
    lazy var passwordView :BaseTextFieldView = {
        let view = BaseTextFieldView()
        view.titleLabel.text = "Password"
        view.textField.placeholder = "********"
        view.eyeIcon.image = UIImage(named: "icon_eye")
        return view
    }()
    
    lazy var signUpButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.colorFFFFFF, for: .normal)
        button.titleLabel?.font = .poppinsSemiBold(ofSize: 16)
        button.layer.cornerRadius = 10
        button.backgroundColor = .colorC67C4E
        return button
    }()
    lazy var termsCond:UIButton = {
        let button = UIButton()
        button.setTitle("By tapping “Sign Up” you accept our terms and condition", for: .normal)
        button.setTitleColor(UIColor.colorC67C4E, for: .normal)
        button.titleLabel?.font = .poppinsRegular(ofSize: 14)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectedBackgroundView = UIView()
        backgroundColor = .color0F0F0F
//        termsCond.gradientEffect(colors: [UIColor.colorB19595.cgColor, UIColor.colorC67C4E.cgColor])
        subviews(titleLabel,subTitleLabel,userNameView,emailView,passwordView,signUpButton,termsCond)
        titleLabel.width(249).height(36).left(0).top(0)
        subTitleLabel.width(318).height(46).left(0).Top == titleLabel.Bottom + 20
        userNameView.width(318).height(90).centerHorizontally().Top == subTitleLabel.Bottom + 40
        emailView.width(318).height(90).centerHorizontally().Top == userNameView.Bottom + 20
        passwordView.width(318).height(90).centerHorizontally().Top == emailView.Bottom + 20
        signUpButton.width(318).height(52).centerHorizontally().Top == passwordView.Bottom + 40
        termsCond.width(308).height(44).left(10).Top == signUpButton.Bottom + 20
        

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

