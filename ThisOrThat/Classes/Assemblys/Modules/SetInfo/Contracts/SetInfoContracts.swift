//
//  SetInfoContracts.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022
//  
//

import Foundation

// Module Input
protocol SetInfoModuleInput {
    
}

// Module Output
protocol SetInfoModuleOutput {
    
}

// View Input
protocol SetInfoViewInput: class {
    func set(title: String)
}

// View Output
protocol SetInfoViewOutput: class {
    func viewDidLoad()
}

// Interactor
protocol SetInfoInteractorInput {
}

// Router
protocol SetInfoRouterProtocol: AlertRoutable {
    
}
