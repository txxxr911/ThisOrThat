//
//  StartGameContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

// Module Input
protocol StartGameModuleInput {
    
}

// Module Output
protocol StartGameModuleOutput {
    
}

// View Input
protocol StartGameViewInput: class {
    func set(title: String)
}

// View Output
protocol StartGameViewOutput: class {
    func viewDidLoad()
    func startButtonPressed()
}

// Interactor
protocol StartGameInteractorInput {
}

// Router
protocol StartGameRouterProtocol: AlertRoutable {
 
    func showGameProcessView()
}
