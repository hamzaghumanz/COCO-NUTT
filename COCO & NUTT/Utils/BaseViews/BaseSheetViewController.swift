//
//  BaseSheetViewController.swift
//  ScannerDoc
//
//  Created by Macbook 5 on 7/26/23.
//

import UIKit
import Stevia

class BaseSheetViewController:BaseViewController {

    public var height:CGFloat = 86.6
    public let bgView:UIView  = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 25
        return view
    }()
    
    public let barView:UIView  = {
        let view = UIView()
//        view.backgroundColor = .colorD9E0F6
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    public let lineView:UIView  = {
        let view = UIView()
//        view.backgroundColor = .colorD6D6D6
        return view
    }()
    
    public let titleLabel:BaseTitleLabel = {
        let label = BaseTitleLabel()
        label.font = .poppinsSemiBold(ofSize: 16)
//        label.textColor = .colorA0A8C4
        label.textAlignment = .center
        return label
    }()
    
    public lazy var crossButton:BaseButton = {
        let iv = BaseButton()
        iv.backgroundColor = .clear
        iv.image("cross-icon")
        iv.addTarget(self, action: #selector(dismissDone), for: .touchUpInside)
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bg = UIButton()
        view.backgroundColor = .clear
        view.subviews(bg,bgView)
        bg.fillContainer()
        bgView.height(height%).bottom(0).fillHorizontally()
        bg.addTarget(self, action: #selector(dismissDone), for: .touchUpInside)
        bgView.subviews(lineView,barView,
                        titleLabel,crossButton)
        
        barView.top(7).height(3).width(23%).centerHorizontally()
        lineView.top(58).fillHorizontally().height(1)
        titleLabel.height(49).fillHorizontally().Top == barView.Bottom
        crossButton.right(4.8%).size(24).Top == barView.Bottom + 12
//        bgView.dropShadow()
    }
    
    @objc
    func dismissDone() {
        self.dismiss(animated: true)
    }
    
}


