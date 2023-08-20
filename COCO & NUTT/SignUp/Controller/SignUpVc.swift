//
//  SignUpVc.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 06/08/2023.
//

import UIKit
import Stevia

class SignUpVc: UIViewController {
    
    lazy var iconImage:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coco_nut")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
     lazy var tableView:UITableView = {
        let tv = UITableView(frame: .zero, style:.grouped)
        tv.delegate = self
        tv.dataSource = self
        tv.register(SignUpTableViewCell.self, forCellReuseIdentifier: SignUpTableViewCell.identifier)
        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        tv.separatorStyle = .none
        tv.backgroundColor = .color0F0F0F
        tv.scrollIndicatorInsets = .zero
        tv.isUserInteractionEnabled = true
        return tv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .color0F0F0F
        setUpView()
    }
    
    
    func setUpView(){
        view.subviews(iconImage,tableView)
        iconImage.width(135).height(35).top(7%).centerHorizontally()
        tableView.width(86%).top(17.8%).bottom(0).centerHorizontally()
        
    }


}

extension SignUpVc:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:SignUpTableViewCell.identifier, for: indexPath) as? SignUpTableViewCell {
            cell.signUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 551
    }
    
    @objc func buttonTapped(){
        let vc = SelectBranches()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

