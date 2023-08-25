//
//  RadioButton.swift
//  SmokeTrack
//
//  Created by Macbook 5 on 8/22/23.
//

import Foundation
import UIKit

class RadioButton: UIButton {
    
    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            commonInit()
        }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            commonInit()
        }

    private func commonInit() {
        layer.cornerRadius = frame.size.width / 2
        layer.borderWidth = 0
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = .white
    }

    private func updateAppearance() {
        layer.borderWidth = isSelected ? 5 : 0
    }
}
