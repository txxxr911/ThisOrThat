//
//  UINavigationController+Ext.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

public extension UINavigationController {
    var rootViewController: UIViewController {
        return self.viewControllers.first!
    }
    
    func setTransparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}
