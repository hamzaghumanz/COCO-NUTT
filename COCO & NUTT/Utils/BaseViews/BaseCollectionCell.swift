//
//  BaseCollectionCell.swift
//  Journey30
//
//  Created by Macbook 5 on 2/3/23.
//

import UIKit
import Stevia

class BaseCollectionCell:UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
    }
    
    
    
}


