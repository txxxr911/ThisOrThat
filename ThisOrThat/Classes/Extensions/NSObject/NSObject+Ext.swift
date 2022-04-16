//
//  NSObject+Ext.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
