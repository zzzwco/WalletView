//
//  WalletLayout.swift
//  WalletView
//
//  Created by keisme on 2018/3/19.
//  Copyright © 2018年 keisme. All rights reserved.
//

import UIKit

class WalletLayout: UICollectionViewLayout {
    
    private let itemHeight: CGFloat = 200
    private let hideFactor: CGFloat = 0.7
    private let springFactor: CGFloat = 0.2
    private let sectionInsets = UIEdgeInsetsMake(20, 20, 0, 20)
    private var layoutAttrs = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        
        collectionView?.contentInset = sectionInsets
        layoutAttrs = computeLayoutAttrs()
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttrs[indexPath.row]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttrs
    }
    
    override var collectionViewContentSize: CGSize {
        let itemsCount = collectionView!.numberOfItems(inSection: 0)
        let size = CGSize(width: collectionView!.bounds.width - sectionInsets.left - sectionInsets.right, height: itemHeight * CGFloat(itemsCount - 1) * (1 - hideFactor) + itemHeight)
        return size
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return newBounds != collectionView?.bounds
    }
}

// MARK: - Internal methods
extension WalletLayout {
    
    private func computeLayoutAttrs() -> [UICollectionViewLayoutAttributes] {
        var indexPath: IndexPath
        var attrs = [UICollectionViewLayoutAttributes]()
        let itemsCount = collectionView!.numberOfItems(inSection: 0)
        
        for currentIndex in 0..<itemsCount {
            indexPath = IndexPath(item: currentIndex, section: 0)
            let y = itemHeight * CGFloat(currentIndex) * (1 - hideFactor)
            let offsetY = collectionView!.contentOffset.y + sectionInsets.top
            let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attr.frame = CGRect(x: 0, y: max(offsetY, y), width: collectionView!.bounds.width - sectionInsets.left - sectionInsets.right, height: itemHeight)
            attr.zIndex = currentIndex
            if offsetY < 0 {
                attr.frame.origin.y = y - fabs(offsetY) + fabs(offsetY) * springFactor * CGFloat(attr.indexPath.item)
            }
            
            attrs.append(attr)
        }
        return attrs
    }
    
}
