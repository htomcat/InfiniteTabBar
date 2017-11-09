//
//  InfiniteTabBarFlowLayout.swift
//  InfiniteTabBar
//
//  Created by htomcat on 2017/11/05.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class InfiniteTabBarFlowLayout: UICollectionViewFlowLayout {
    private func itemsCount(at section: Int) -> Int {
        guard let itemsCount = collectionView?.numberOfItems(inSection: section) else {
            return 0
        }
        return itemsCount
    }
    private func itemsWidth() -> CGFloat {
        guard itemsCount(at: 0) > InfiniteTabBar.defaultMaxTabCount else {
            return UIScreen.main.bounds.width / CGFloat(itemsCount(at: 0))
        }
        return UIScreen.main.bounds.width / CGFloat(InfiniteTabBar.defaultMaxTabCount)
    }

    private func extraWidth() -> CGFloat {
        let extraCount = itemsCount(at: 0) - InfiniteTabBar.defaultMaxTabCount
        return CGFloat(extraCount) * CGFloat(itemsWidth())
    }
    
    override var collectionViewContentSize: CGSize {
        guard itemsCount(at: 0) > InfiniteTabBar.defaultMaxTabCount else {
            return super.collectionViewContentSize
        }
        return CGSize(width: UIScreen.main.bounds.width + extraWidth(),
                      height: InfiniteTabBar.height)
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        guard itemsCount(at: 0) > 0 else {
            return nil
        }
        for index in 0..<itemsCount(at: 0) {
            let indexPath = IndexPath(row: index, section: 0)
            guard let attribute = layoutAttributesForItem(at: indexPath) else {
                break
            }
            attributes.append(attribute)
        }
        return attributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attribute.frame = CGRect(x: itemsWidth() * CGFloat(indexPath.row),
                                 y: 0,
                                 width: itemsWidth(),
                                 height: InfiniteTabBar.height)
        return attribute
    }
}
