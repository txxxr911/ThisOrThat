//
//  Module.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

protocol ModuleOutput {
    
}

struct Module<Input, Output>: Presentable {
    var view: UIViewController
    var input: Input
    var output: Output
    
    func toPresent() -> UIViewController {
        return view
    }
}
