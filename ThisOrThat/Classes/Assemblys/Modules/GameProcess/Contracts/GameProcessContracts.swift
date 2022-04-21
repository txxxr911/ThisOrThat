//
//  GameProcessContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

// Module Input
protocol GameProcessModuleInput {
    
}

// Module Output
protocol GameProcessModuleOutput {
    
}

// View Input
protocol GameProcessViewInput: class {
    func set(title: String)
}

// View Output
protocol GameProcessViewOutput: class {
    func viewDidLoad()
}

// Interactor
protocol GameProcessInteractorInput {
}

// Router
protocol GameProcessRouterProtocol: AlertRoutable {
    
}
