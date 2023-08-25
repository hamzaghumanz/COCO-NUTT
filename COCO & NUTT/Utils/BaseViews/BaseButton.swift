//
//  BaseButton.swift
//  Journey30
//
//  Created by Macbook 5 on 2/3/23.
//

import Stevia
import UIKit

class BaseButton:UIButton {
    
    var isImapctEnable = true
    var font:UIFont = UIFont.poppinsSemiBold(ofSize: 16) {
        didSet {
            self.titleLabel?.font = font
        }
    }
    
    var image:UIImage? {
        didSet {
            self.setImage(image, for: .normal)
        }
    }
    var title:String? {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    var titleColor:UIColor = .white {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(tocuhdown), for: [.touchDown, .touchDragEnter])
        self.addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        backgroundColor = .clear
        titleLabel?.font = font
        setTitle("Next", for: .normal)
        titleColor = .white
//        titleColor = .labelPrimaryDark
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func tocuhdown(_ sender:UIButton) {
        if isImapctEnable {
//            sender.touchDownEffect()
        }
    }
    
    @objc private func touchUp(_ sender:UIButton) {
        if isImapctEnable {
//            sender.touchUpEffect()
        }
    }
    
    func setupViews() {
        
    }
    

    
   
}
