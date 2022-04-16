//
//  MainContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

// Module Input
protocol MainModuleInput {
    
}

// Module Output
protocol MainModuleOutput: ModuleOutput {
    
}

// View Input
protocol MainViewInput: AnyObject {
    func set(title: String)
}

// View Output
protocol MainViewOutput: AnyObject {
    func viewDidLoad()
}

// Interactor
protocol MainInteractorInput {

}

// Router
protocol MainRouterProtocol: AlertRoutable {

}
