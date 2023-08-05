//
//  BaseTextFieldView.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 06/08/2023.
//

import UIKit
import Stevia

class BaseTextFieldView: UIView {
    
    lazy var titleLabel :UILabel = {
        let label = UILabel()
        label.font = .poppinsMedium(ofSize: 14)
        label.textColor = .colorB19595
        label.textAlignment = .left
        return label
    }()

    lazy var textField:UITextField = {
        let field = UITextField()
        field.backgroundColor =  .clear
        field.textColor = .colorFFFFFF
        field.textContentType = .password
        field.attributedText = NSAttributedString(string: "",
                                                  attributes: [NSAttributedString.Key.font : UIFont.poppinsRegular(ofSize: 18),
                                                               NSAttributedString.Key.foregroundColor : UIColor.colorFFFFFF])
        field.returnKeyType = .done
        field.delegate = self
        return field
    }()
    
    lazy var sepratorView :UIView = {
        let view = UIView()
        view.backgroundColor = .colorC67C4E
        return view
    }()
    lazy var eyeIcon:UIImageView = {
        let eyeIcon = UIImageView()
        eyeIcon.contentMode = .scaleAspectFit
        return eyeIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subviews(titleLabel,textField,sepratorView,eyeIcon)
        titleLabel.width(140).height(22).left(0).top(0)
        textField.width(67%).height(30).left(0).Top == titleLabel.Bottom + 20
        sepratorView.width(100%).height(2).bottom(0)
        eyeIcon.width(24).height(24).right(20).Top == titleLabel.Bottom + 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BaseTextFieldView:UITextFieldDelegate,UITextViewDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    
}


