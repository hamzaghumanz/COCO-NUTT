//
//  DropdownTableViewCell.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 10/08/2023.
//
import UIKit

class DropdownTableViewCell: UITableViewCell {

    static let reuseIdentifier = "DropdownTableViewCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .colorA9A9A9
        label.font = .poppinsMedium(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func set(_ text: String) {
        label.text = text
    }
 
}
