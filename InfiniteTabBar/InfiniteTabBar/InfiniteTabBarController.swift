//
//  InfiniteTabBarController.swift
//  InfiniteTabBar
//
//  Created by htomcat on 2017/10/22.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class InfiniteTabBarController: UIViewController {
    var viewControllers: [UIViewController]?
    var selectedViewController: UIViewController?
    //var selectedIndex: Int
    //var tabBar: InfiniteTabBar

    override func viewDidLoad() {
        super.viewDidLoad()
        let nc = UITabBarController()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
