//
//  StrongBox.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

protocol StrongBox: class {
    var strongBoxHolder: [String : AnyObject] { set get }
}

extension StrongBox {
    func strongBox<T>(_ configure: () -> T) -> T {
        let key = ObjectKey(T.self).key
        if let object = self.strongBoxHolder[key] {
            return object as! T
        }
        let object = configure()
        strongBoxHolder[key] = object as AnyObject
        return object
    }
}
