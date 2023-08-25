//
//  UICollectionView+.swift
//  WritBot
//
//  Created by Macbook 5 on 2/13/23.
//

import UIKit
extension UICollectionView {
  var visibleCurrentCellIndexPath: IndexPath? {
    for cell in self.visibleCells {
      let indexPath = self.indexPath(for: cell)
      return indexPath
    }
    
    return nil
  }
}
extension UICollectionView {
    
    func registerCell(ofType cellType: UICollectionViewCell.Type) {
        let name = String(describing: cellType.self)
        register(cellType, forCellWithReuseIdentifier: name)
    }
    
    func dequeueTypedCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: T.self),
        for: indexPath) as! T
    }
}
extension UITableView {
    
    
    func registerCell(ofType cellType: UITableViewCell.Type) {
        let name = String(describing: cellType.self)
        register(cellType, forCellReuseIdentifier: name)
    }
    
    func dequeueTypedCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self),
        for: indexPath) as! T
    }
}
