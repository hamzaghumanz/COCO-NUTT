//
//  PageIndicatorView.swift
//  SmokeTrack
//
//  Created by Macbook 5 on 8/15/23.
//

import UIKit

class PageIndicatorView: UIView {
    private let indicatorSize = CGSize(width: 18, height: 5)
    private let indicatorSpacing: CGFloat = 5
    
    private var numberOfPages: Int = 0
    private var currentPage: Int = 0
    
    init(frame: CGRect, numberOfPages: Int) {
        super.init(frame: frame)
        self.numberOfPages = numberOfPages
        setupIndicators()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupIndicators()
    }
    
    private func setupIndicators() {
        for i in 0..<numberOfPages {
            let indicatorFrame = CGRect(
                x: CGFloat(i) * (indicatorSize.width + indicatorSpacing),
                y: 0,
                width: indicatorSize.width,
                height: indicatorSize.height
            )
            let indicatorView = UIView(frame: indicatorFrame)
            indicatorView.layer.cornerRadius = indicatorSize.height / 2
            indicatorView.backgroundColor = (i == currentPage) ? UIColor.red : UIColor.blue
            addSubview(indicatorView)
        }
    }
    
    func setCurrentPage(_ page: Int) {
        currentPage = page
        for (index, subview) in subviews.enumerated() {
            subview.backgroundColor = (index <= currentPage) ? UIColor.red : UIColor.blue
        }
    }
}


class PageNumberIndicator: UIView {
    
    private let labelSize = CGSize(width: 36, height: 36)
    private let indicatorSpacing: CGFloat = 15
    
    private var numberOfPages: Int = 0
    private var currentPage: Int = 0
    
    init(frame: CGRect, numberOfPages: Int) {
        super.init(frame: frame)
        self.numberOfPages = numberOfPages
        setupIndicators()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupIndicators()
    }
    
    private func setupIndicators() {
        let percentSpace = UIScreen.main.bounds.width * 0.0280
        for i in 0..<numberOfPages {
            let indicatorFrame = CGRect(
                x: CGFloat(i) * (labelSize.width + percentSpace),
                y: 0,
                width: labelSize.width,
                height: labelSize.height
            )
            let label = UILabel(frame: indicatorFrame)
            label.layer.cornerRadius = labelSize.height / 2
            label.text = "\(i + 1)"
            label.textAlignment = .center
            label.font = .poppinsSemiBold(ofSize: 16)
            label.textColor = (i == currentPage) ? UIColor.white : UIColor.red
            label.backgroundColor = .red
            label.clipsToBounds = true
            addSubview(label)
        }
    }
    
    func setCurrentPage(_ page: Int) {
        currentPage = page
        for (index, subview) in subviews.enumerated() {
            if let label = subview as? UILabel {
                UIView.animate(withDuration: 0.1, delay: 0) {
                    DispatchQueue.main.async {
                        label.textColor = (index == self.currentPage) ? UIColor.white : UIColor.red
                    }
                }
            }
        }
    }
}
