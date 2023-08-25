//
//  VerticalButton.swift
//  ScannerDoc
//
//  Created by Macbook 5 on 7/20/23.
//

import UIKit
import Stevia
class VerticalButton:UIButton {
    
    var color:UIColor = .white
    
    var icon:String = "" {
        didSet {
            iconView.image = UIImage(named: icon)
        }
    }
    
    var title:String = ""{
        didSet {
            label.text = title
            label.textColor = color
        }
    }
    
    lazy var label:UILabel = {
        let label = UILabel()
        label.font = .poppinsSemiBold(ofSize: 16)
        label.textColor = color
        return label
    }()
    
    let iconView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subviews(iconView,label)
     
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.size(24).top(14).centerHorizontally()
        label.height(20).centerHorizontally().Top == iconView.Bottom
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


