//
//  InfiniteTabBarController.swift
//  InfiniteTabBar
//
//  Created by htomcat on 2017/10/22.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class InfiniteTabBarController: UIViewController {
    // MARK: Properties
    var viewControllers: [UIViewController]?
    var selectedViewController: UIViewController?
    
    private lazy var tabBar: InfiniteTabBar = self.createInfiniteTabBar()
    private lazy var contentView: UIView = self.createContentView()
    
    //var selectedIndex: Int
    //var tabBar: InfiniteTabBar { get }

    // MARK: Object Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let count = viewControllers?.count, count > 0 else {
            fatalError("There is no viewControllers")
        }
        tabBar.count = count
        tabBar.viewControllers = viewControllers
        addSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSubviews()
    }
    // MARK: Methods
    // Initialize Content View
    private func createContentView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }
    
    // Initialize Tab Bar
    private func createInfiniteTabBar() -> InfiniteTabBar {
        let tabBar = InfiniteTabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }

    // Add subviews
    private func addSubviews() {
        view.addSubview(contentView)
        view.addSubview(tabBar)
    }
    // Layout subviews
    private func layoutSubviews() {
        let safeArea = view.safeAreaLayoutGuide
        
        // layout Content View
        /// Top
        contentView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        
        /// leading
        contentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        
        /// trailing
        contentView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        /// bottom
        contentView.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        
        // layout Tab Bar
        /// Height
        tabBar.heightAnchor.constraint(equalToConstant: InfiniteTabBar.height).isActive = true
    
        /// leading
        tabBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        
        /// trailing
        tabBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        /// bottom
        tabBar.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
}

protocol PropertyStoring {
    
    associatedtype T
    
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T
}

extension PropertyStoring {
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            return defaultValue
        }
        return value
    }
}

extension UIViewController: PropertyStoring {
    typealias T = InfiniteTabBarItem

    private struct CustomProperties {
        static var infiniteTabBarItem = InfiniteTabBarItem(title: nil, image: nil, selectedImage: nil)
    }
    
    var infiniteTabBarItem: InfiniteTabBarItem {
        get {
            return getAssociatedObject(&CustomProperties.infiniteTabBarItem, defaultValue: CustomProperties.infiniteTabBarItem)
        }
        set {
            return objc_setAssociatedObject(self, &CustomProperties.infiniteTabBarItem, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
