//
//  BaseTableCell.swift
//  Journey30
//
//  Created by Macbook 5 on 2/3/23.
//

import UIKit
import Stevia

class BaseTableCell:UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
    }
    
    
    
}


