//
//  Presentable.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}
