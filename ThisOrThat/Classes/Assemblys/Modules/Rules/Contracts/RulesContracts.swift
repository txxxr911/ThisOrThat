//
//  RulesContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

// Module Input
protocol RulesModuleInput {
    
}

// Module Output
protocol RulesModuleOutput {
    
}

// View Input
protocol RulesViewInput: class {
    func set(title: String)
}

// View Output
protocol RulesViewOutput: class {
    func viewDidLoad()
}

// Interactor
protocol RulesInteractorInput {
}

// Router
protocol RulesRouterProtocol: AlertRoutable {
    
}
