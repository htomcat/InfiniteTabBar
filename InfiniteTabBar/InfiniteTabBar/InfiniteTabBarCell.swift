//
//  InfiniteTabBarCell.swift
//  InfiniteTabBar
//
//  Created by htomcat on 2017/11/05.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class InfiniteTabBarCell: UICollectionViewCell {
    static let identifier = "InfiniteTabBarCell"
    private lazy var titleLabel: UILabel = self.createTitleLabel()
    private lazy var imageButton: UIButton = self.createImageButton()
    private var subview: [String: Any] {
        return ["title": titleLabel,
                "image": imageButton]
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutVertical()
        layoutHorizontal()
    }
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12.0)
        label.textAlignment = .center
        return label
    }
    private func createImageButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    private func layoutHorizontal() {
        let vfl1 = "H:|-[title]-|"
        let vfl2 = "H:|-[image]-|"
        [vfl1, vfl2].forEach { vfl in
            let constraint = NSLayoutConstraint.constraints(withVisualFormat: vfl,
                                                            options: [],
                                                            metrics: nil,
                                                            views: subview)
            addConstraints(constraint)
        }
    }
    private func layoutVertical() {
        let vfl = "V:|-[image(25)]-0-[title]-0@999-|"
        let constraint = NSLayoutConstraint.constraints(withVisualFormat: vfl,
                                                        options: [],
                                                        metrics: nil,
                                                        views: subview)
        addConstraints(constraint)
    }
    func configure(with vc: UIViewController) {
        titleLabel.text = vc.infiniteTabBarItem.title ?? vc.title
        imageButton.setImage(vc.infiniteTabBarItem.image, for: .normal)
        imageButton.setImage(vc.infiniteTabBarItem.selectedImage, for: .selected)
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageButton)
        layoutIfNeeded()
    }
}
