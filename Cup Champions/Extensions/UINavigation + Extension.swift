//
//  UINavigation + Extension.swift
//  Cup Champions
//
//  Created by Ricardo Santos on 19/09/22.
//

import UIKit

extension UINavigationController {
    func setupNav() {
        navigationBar.isTranslucent = false
        navigationBar.barStyle = .black
        navigationBar.barTintColor = .black
        navigationBar.backgroundColor = .black
        navigationBar.topItem?.title = kNavTitle
    }
}
