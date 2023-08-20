//
//  SelectBranches.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 08/08/2023.
//

import UIKit
import Stevia


class SelectBranches: UIViewController {
    
    var dropdown = DropDownButton()
    
    lazy var top_Icon:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top_Icon")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var bottom_Icon:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bottom_Icon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let brancheTitle:UILabel = {
        let label = UILabel()
        label.text = "Select Branch"
        label.textAlignment = .center
        label.font = .poppinsMedium(ofSize: 20)
        label.textColor = .color1E1E1E
        return label
    }()
    
    lazy var continueBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .poppinsSemiBold(ofSize: 16)
        button.setTitleColor(.colorFFFFFF, for: .normal)
        button.backgroundColor = .colorC67C4E
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorFFFFFF
        setUpView()
    }
    
    
    func setUpView(){
        view.subviews(top_Icon,bottom_Icon,brancheTitle,dropdown,continueBtn)
        top_Icon.width(250).height(239).top(0).centerHorizontally()
        brancheTitle.width(140).height(30).top(32%).centerHorizontally()
        dropdown.width(322).height(58).centerHorizontally().Top == brancheTitle.Bottom + 10
        continueBtn.width(318).height(52).centerHorizontally().Top == dropdown.Bottom + 20
        bottom_Icon.width(100%).height(258).bottom(0)
        dropdown.dataSource = ["Branch 1", "Branch 2", "Branch 3", "Branch 4"]
        
    }
    @objc func buttonTapped(){
        let vc = HomeController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

