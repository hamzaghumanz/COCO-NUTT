//
//  WelcomeScreen.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 05/08/2023.
//

import UIKit
import Stevia

class WelcomeScreen: UIViewController {
    
    lazy var appLogo:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coco_nut")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var coffeImg:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "teaCup")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var onbaordBlackRect:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "OnboardBlackRect")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var onbaordBlackRectBottom:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "OnboardBlackRectBt")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let tasteLabel:UILabel = {
        let label = UILabel()
        label.text = "Coffee so good, your taste buds will love it.".uppercased()
        label.textAlignment = .center
        label.font = .poppinsMedium(ofSize: 30)
        label.textColor = .colorFFFFFF
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private let grainLabel:UILabel = {
        let label = UILabel()
        label.text = "The best grain, the finest roast, the powerful flavor."
        label.textAlignment = .center
        label.font = .poppinsRegular(ofSize: 14)
        label.textColor = .colorA9A9A9
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip Now", for: .normal)
        button.titleLabel?.font = .poppinsMedium(ofSize: 14)
        button.setTitleColor(.colorA9A9A9, for: .normal)
        button.contentHorizontalAlignment = .left
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    lazy var logInBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Login / Signup", for: .normal)
        button.titleLabel?.font = .poppinsMedium(ofSize: 15)
        button.setTitleColor(.colorFFFFFF, for: .normal)
        button.backgroundColor = .colorC67C4E
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color0F0F0F
        setUpView()
        
        for family in UIFont.familyNames {

            let sName: String = family as String
            print("family: \(sName)")
                    
            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setUpView(){
        view.subviews(coffeImg,onbaordBlackRect,onbaordBlackRectBottom,appLogo,tasteLabel,grainLabel,logInBtn,skipButton)
        appLogo.width(240).height(62).top(11.82%).centerHorizontally()
        onbaordBlackRect.fillHorizontally().bottom(63%).height(44.5%)
        coffeImg.bottom(28.6%).width(124.8%).centerHorizontally().sizeToFit()
        onbaordBlackRectBottom.fillHorizontally().bottom(0).height(44.5%)
        logInBtn.bottom(view.safeAreaInsets().bottom + 8).height(52).width(170).right(6%)
        skipButton.bottom(view.safeAreaInsets().bottom + 8).height(52).width(170).left(8%)
        grainLabel.height(44).width(285).centerHorizontally().bottom(15.88%)
        tasteLabel.width(315).centerHorizontally().Bottom == grainLabel.Top - 10
        tasteLabel.sizeToFit()
    }

    @objc
    func didTapLogin() {
        navigationController?.pushViewController(SignInVC(), animated: true)
    }

    
    @objc
    func didTapSkip() {
        navigationController?.pushViewController(SignUpVc(), animated: true)
    }

    
    
}

