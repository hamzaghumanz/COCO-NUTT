//
//  BottomAlignLayout.swift
//  WriterPro
//
//  Created by Macbook 5 on 7/14/23.
//

import Foundation
import UIKit

class BottomAlignedFlowLayout: UICollectionViewFlowLayout {
    override var collectionViewContentSize: CGSize {
        let contentSize = super.collectionViewContentSize
        let collectionViewHeight = collectionView?.bounds.height ?? 0
        let contentHeight = max(collectionViewHeight, contentSize.height)
        return CGSize(width: contentSize.width, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        let verticalOffset = collectionView?.contentOffset.y ?? 0
        let collectionViewHeight = collectionView?.bounds.height ?? 0
        
        let adjustedRect = CGRect(x: rect.origin.x, y: rect.origin.y - verticalOffset, width: rect.size.width, height: rect.size.height)
        
        layoutAttributes?.forEach { attributes in
            if adjustedRect.intersects(attributes.frame) {
                let itemOffset = attributes.frame.origin.y - verticalOffset
                attributes.frame.origin.y = collectionViewHeight - attributes.frame.size.height + itemOffset
            }
        }
        
        return layoutAttributes
    }
}
