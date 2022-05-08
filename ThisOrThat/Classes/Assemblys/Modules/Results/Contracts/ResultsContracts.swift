//
//  ResultsContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

// Module Input
protocol ResultsModuleInput {
    
}

// Module Output
protocol ResultsModuleOutput {
    
}

// View Input
protocol ResultsViewInput: class {
    func set(title: String)
}

// View Output
protocol ResultsViewOutput: class {
    func viewDidLoad()
    var players: [Player] { get }
    func endGame()
}

// Interactor
protocol ResultsInteractorInput {
    var players: [Player] {get set}
}

// Router
protocol ResultsRouterProtocol: AlertRoutable {
    
}
