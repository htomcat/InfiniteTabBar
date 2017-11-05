//
//  InfiniteTabBar.swift
//  InfiniteTabBar
//
//  Created by htomcat on 2017/10/22.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class InfiniteTabBar: UICollectionView {
    // MARK: Properties
    static let height: CGFloat = 50.0
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    var count: Int?
    
    // MARK: Object Lifecycle
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let rect = CGRect(x: 0, y: 0, width: screenWidth, height: type(of: self).height)
        let customLayout = InfiniteTabBarFlowLayout()
        super.init(frame: rect, collectionViewLayout: customLayout)
        
        // Setup
        registerCell()
        
        // Set delegate
        delegate = self
        dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCell() {
        register(InfiniteTabBarCell.self, forCellWithReuseIdentifier: InfiniteTabBarCell.identifier)
    }
}

extension InfiniteTabBar: UICollectionViewDelegate {
}

extension InfiniteTabBar: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfiniteTabBarCell.identifier, for: indexPath) as? InfiniteTabBarCell else {
            return UICollectionViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.backgroundColor = .red
        case 1:
            cell.backgroundColor = .blue
        default:
            cell.backgroundColor = .yellow
        }
        return cell
    }
}
