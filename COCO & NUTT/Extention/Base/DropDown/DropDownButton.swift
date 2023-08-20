//
//  DropDownButton.swift
//  COCO & NUTT
//
//  Created by MacBook Pro on 10/08/2023.
//

import UIKit

protocol DropDownButtonDelegate: AnyObject {
    func didSelect(_ index: Int)
}

class DropDownButton: UIView {

    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Branch", for: .normal)
        button.setTitleColor(.colorA9A9A9, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colorBFBFBF.cgColor
        button.titleLabel?.font = .poppinsMedium(ofSize: 14)
        return button
    }()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 4
        stack.axis = .vertical
        return stack
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true
        table.layer.borderWidth = 1
        table.layer.borderColor = UIColor.colorBFBFBF.cgColor
        table.register(DropdownTableViewCell.self, forCellReuseIdentifier: DropdownTableViewCell.reuseIdentifier)
        return table
    }()

    var dataSource: [String] = [] {
        didSet {
            updateTableDataSource()
        }
    }

    var title: String = "" {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }

    var delegate: DropDownButtonDelegate?

    var tableViewHeight: NSLayoutConstraint?

    var buttonHeightConstraint: NSLayoutConstraint?
    var buttonHeight: CGFloat = 58 {
        didSet {
            buttonHeightConstraint?.constant = buttonHeight
            updateTableDataSource()
        }
    }

    var maxVisibleCellsAmount: Int = 4 {
        didSet {
            updateTableDataSource()
        }
    }

    var buttonBottomConstraint: NSLayoutYAxisAnchor {
        button.bottomAnchor
    }

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        addSubview(stackView)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo:topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        buttonHeightConstraint = button.heightAnchor.constraint(equalToConstant: buttonHeight)
        buttonHeightConstraint?.isActive = true
        tableViewHeight = tableView.heightAnchor.constraint(equalToConstant: 0)
        tableViewHeight?.isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
        button.layer.cornerRadius = 10
    }

    func updateTableDataSource() {
        if dataSource.count >= maxVisibleCellsAmount {
            tableViewHeight?.constant = CGFloat(maxVisibleCellsAmount) * buttonHeight
        } else {
            tableViewHeight?.constant = CGFloat(dataSource.count) * buttonHeight
        }
        tableView.reloadData()
    }

    @objc private func buttonTapped() {
        tableView.isHidden.toggle()
    }

}

extension DropDownButton: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DropdownTableViewCell.reuseIdentifier, for: indexPath) as? DropdownTableViewCell else { return UITableViewCell() }
        cell.set(dataSource[indexPath.row])
        return cell
    }

}

extension DropDownButton: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        button.setTitle(dataSource[indexPath.row], for: .normal)
        delegate?.didSelect(indexPath.row)
        tableView.isHidden = true
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return buttonHeight
    }
}

