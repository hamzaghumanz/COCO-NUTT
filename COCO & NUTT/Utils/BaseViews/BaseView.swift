//
//  BaseView.swift
//  Journey30
//
//  Created by Macbook 5 on 2/3/23.
//

import UIKit
import Stevia

class BaseView:UIView {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        initKeypadObservers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
 
    fileprivate
    func initKeypadObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
     
    }
    
    @objc
    private func didAddGalleryITems() {
        addImagesFromGaller()
    }
    
    func addImagesFromGaller() {
        
    }
    
  

    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        var h:CGFloat = 200
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
         
            h = keyboardRectangle.height
          
        }
        keyboardMode(isActive: true, height: h)
    }
    
    @objc
    private func keyboardWillHide(notification: NSNotification) {
     
        keyboardMode(isActive: false, height: 0)
    }
    
    
    func keyboardMode(isActive:Bool,height:CGFloat) {
        
    }
    
    
}

//class ToolbarView:BaseView {
//    
//    var didTapToolItem:((Bool) -> ())?
//    
//    lazy var close:UIButton = {
//        let button = UIButton()
//        button.setTitle("Cancel", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.tag = 0
//        button.addTarget(self, action: #selector(didTapDone(_:)), for: .touchUpInside)
//        return button
//    }()
//    
//    lazy var done:UIButton = {
//        let button = UIButton()
//        button.setTitle("Done", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(didTapDone(_:)), for: .touchUpInside)
//        button.tag = 1
//        return button
//    }()
//    
//    override func setupViews() {
//        super.setupViews()
//        self.backgroundColor = .tertiarySystemBackground
//        subviews(close,done)
//        close.left(20).fillVertically().sizeToFit()
//        done.right(20).fillVertically().sizeToFit()
//    }
//    
//    @objc
//    func didTapDone(_ sender:UIButton) {
//        didTapToolItem?(sender.tag == 1)
//    }
//    
//    
//}
