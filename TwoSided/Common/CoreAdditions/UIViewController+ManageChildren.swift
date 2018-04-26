//
//  UIViewController+ManageChildren.swift
//  Menagerie
//
//  Created by C4Q on 4/17/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }
}
