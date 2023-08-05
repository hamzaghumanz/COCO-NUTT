//
//  ViewController.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 05/08/2023.
//

import UIKit
import Stevia

class onBoardingVc: UIViewController {
    
    lazy var cocoNut:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coco_nut")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var coffeImg:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "teaCup")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let tasteLabel:UILabel = {
        let label = UILabel()
        label.text = "Coffee so good, your taste buds will love it."
        label.textAlignment = .center
        label.font = .poppinsSemiBold(ofSize: 30)
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
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color0F0F0F
        setUpView()
    }
    
    
    func setUpView(){
        view.subviews(cocoNut,coffeImg,tasteLabel,grainLabel,skipButton,logInBtn)
        cocoNut.width(240).height(62).top(11.8%).centerHorizontally()
        coffeImg.width(100%).height(55%).Top == cocoNut.Bottom
        tasteLabel.width(100%).Top == coffeImg.Bottom
        grainLabel.width(100%).height(44).Top == tasteLabel.Bottom
        skipButton.width(135).height(52).left(20).bottom(20)
        logInBtn.width(135).height(52).right(20).bottom(20)
        
    }
    @objc func buttonTapped(){
        let vc = SignInVC()
        navigationController?.pushViewController(vc, animated: true)        
    }
}
